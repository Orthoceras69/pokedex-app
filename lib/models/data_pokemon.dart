class DataPokemon {
  final List abilities, types, description, stats, gender;
  final String name,
      id,
      spriteNormalFront,
      spriteNormalBack,
      spriteShinyFront,
      spriteShinyBack,
      height,
      weight,
      baseExperience,
      baseHappiness,
      generation,
      habitat;
  DataPokemon(
      this.name,
      this.id,
      this.spriteNormalFront,
      this.spriteNormalBack,
      this.spriteShinyFront,
      this.spriteShinyBack,
      this.height,
      this.weight,
      this.stats,
      this.baseExperience,
      this.baseHappiness,
      this.gender,
      this.generation,
      this.habitat,
      this.types,
      this.abilities,
      this.description);
}
