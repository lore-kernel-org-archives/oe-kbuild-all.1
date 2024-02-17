Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 389697EF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Feb 2024 02:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708136906; cv=none; b=if7zSez+/C+yX2vgO3pi8BwgWl1LR5coQJQFd5fiAA5ZD1jIUzzTmGiySqHqjLhXLh4eHL1rNYewWIg7A/cAHnCk2NvgIP3EKtvKZV4j5YWDNVCgP4piBMd6JBcMQ4xJCvFeMiBgLY1kTvs1prwh7ZPvvXSIwdlM8rotkKhcH5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708136906; c=relaxed/simple;
	bh=nmtBWLEt0+p83q4IqcPGm9SalasU5sZA3bmUBGHX3Yc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gxCBFRnuOvfwfce1t3/duTBy8R38S320lWaIYGm1R2uGxnMJFczJ1an4ICT+tya/VNLO3Ch/toS2g2nvqFieURBJpWotiBMylWbXo98VTWVcZXq3m537Jz8uw6KvYW6Vznx7fVHXREcovt1QVUBOp8ivbnQ8IgWSWgouwmb5Y+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RHg35m3p; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RHg35m3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708136905; x=1739672905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nmtBWLEt0+p83q4IqcPGm9SalasU5sZA3bmUBGHX3Yc=;
  b=RHg35m3pFlvGbsReGTe9B7+yP+MeAbnS8IklgGn0ywDggKOlgD3GzU9+
   naF6TTtrprSTqFSVU+AKjQcL96PgPq6ukgoZ0J+02LS1Yv9y/J5kJ3dWn
   eYumctUJ7lqKmN7l3RBHIbdP9r7gd4dr8J2G4ETPueU278wxgUBpNe0pi
   cREn7wTIRPL0y+Mdq9I18vfVQ/dObeS3K5ro2i+Dp0DJWunZQ1pxFTDA5
   OVIMnWRCLhAegL7gheGFk2vHf5BMDP+eF84hV7Ac0C70HxAXScSJP3n2V
   vOVWl3nKZpy3AE889D2eN8zu7cyA++Fua0XN2bIlE+V7pbPoA9QehaOVv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10986"; a="2397086"
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="2397086"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2024 18:28:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,165,1705392000"; 
   d="scan'208";a="4289040"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 16 Feb 2024 18:28:21 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbAR9-0001lM-1b;
	Sat, 17 Feb 2024 02:28:19 +0000
Date: Sat, 17 Feb 2024 10:27:39 +0800
From: kernel test robot <lkp@intel.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	linux-doc@vger.kernel.org
Subject: [atishp04:counter_delegation_rfc 5/18] dtbs_check:
 Documentation/devicetree/bindings/riscv/extensions.yaml:137:1: [error]
 syntax error: found character '\t' that cannot start any token (syntax)
Message-ID: <202402171017.yO5UKUJZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux counter_delegation_rfc
head:   2eb2a8316558903cb63c6969c2ea38b777cd6361
commit: 82e0670f2a3c4cb1ccf10e2ed1d506976eece951 [5/18] dt-bindings: riscv: add Sxcsrind ISA extension description
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240217/202402171017.yO5UKUJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402171017.yO5UKUJZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/riscv/extensions.yaml:137:1: [error] syntax error: found character '\t' that cannot start any token (syntax)
--
>> Documentation/devicetree/bindings/riscv/cpus.yaml:
   while scanning a block scalar
     in "<unicode string>", line 132, column 24
   found a tab character where an indentation space is expected
     in "<unicode string>", line 137, column 1
>> Documentation/devicetree/bindings/riscv/extensions.yaml:137:1: found a tab character where an indentation space is expected
--
>> Documentation/devicetree/bindings/riscv/extensions.yaml: ignoring, error parsing file
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition

vim +137 Documentation/devicetree/bindings/riscv/extensions.yaml

     8	
     9	maintainers:
    10	  - Paul Walmsley <paul.walmsley@sifive.com>
    11	  - Palmer Dabbelt <palmer@sifive.com>
    12	  - Conor Dooley <conor@kernel.org>
    13	
    14	description: |
    15	  RISC-V has a large number of extensions, some of which are "standard"
    16	  extensions, meaning they are ratified by RISC-V International, and others
    17	  are "vendor" extensions.
    18	  This document defines properties that indicate whether a hart supports a
    19	  given extension.
    20	
    21	  Once a standard extension has been ratified, no changes in behaviour can be
    22	  made without the creation of a new extension.
    23	  The properties for standard extensions therefore map to their originally
    24	  ratified states, with the exception of the I, Zicntr & Zihpm extensions.
    25	  See the "i" property for more information.
    26	
    27	select:
    28	  properties:
    29	    compatible:
    30	      contains:
    31	        const: riscv
    32	
    33	properties:
    34	  riscv,isa:
    35	    description:
    36	      Identifies the specific RISC-V instruction set architecture
    37	      supported by the hart.  These are documented in the RISC-V
    38	      User-Level ISA document, available from
    39	      https://riscv.org/specifications/
    40	
    41	      Due to revisions of the ISA specification, some deviations
    42	      have arisen over time.
    43	      Notably, riscv,isa was defined prior to the creation of the
    44	      Zicntr, Zicsr, Zifencei and Zihpm extensions and thus "i"
    45	      implies "zicntr_zicsr_zifencei_zihpm".
    46	
    47	      While the isa strings in ISA specification are case
    48	      insensitive, letters in the riscv,isa string must be all
    49	      lowercase.
    50	    $ref: /schemas/types.yaml#/definitions/string
    51	    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[0-9a-z])+)?(?:_[hsxz](?:[0-9a-z])+)*$
    52	    deprecated: true
    53	
    54	  riscv,isa-base:
    55	    description:
    56	      The base ISA implemented by this hart, as described by the 20191213
    57	      version of the unprivileged ISA specification.
    58	    enum:
    59	      - rv32i
    60	      - rv64i
    61	
    62	  riscv,isa-extensions:
    63	    $ref: /schemas/types.yaml#/definitions/string-array
    64	    minItems: 1
    65	    description: Extensions supported by the hart.
    66	    items:
    67	      anyOf:
    68	        # single letter extensions, in canonical order
    69	        - const: i
    70	          description: |
    71	            The base integer instruction set, as ratified in the 20191213
    72	            version of the unprivileged ISA specification.
    73	
    74	            This does not include Chapter 10, "Counters", which was moved into
    75	            the Zicntr and Zihpm extensions after the ratification of the
    76	            20191213 version of the unprivileged specification.
    77	
    78	        - const: m
    79	          description:
    80	            The standard M extension for integer multiplication and division, as
    81	            ratified in the 20191213 version of the unprivileged ISA
    82	            specification.
    83	
    84	        - const: a
    85	          description:
    86	            The standard A extension for atomic instructions, as ratified in the
    87	            20191213 version of the unprivileged ISA specification.
    88	
    89	        - const: f
    90	          description:
    91	            The standard F extension for single-precision floating point, as
    92	            ratified in the 20191213 version of the unprivileged ISA
    93	            specification.
    94	
    95	        - const: d
    96	          description:
    97	            The standard D extension for double-precision floating-point, as
    98	            ratified in the 20191213 version of the unprivileged ISA
    99	            specification.
   100	
   101	        - const: q
   102	          description:
   103	            The standard Q extension for quad-precision floating-point, as
   104	            ratified in the 20191213 version of the unprivileged ISA
   105	            specification.
   106	
   107	        - const: c
   108	          description:
   109	            The standard C extension for compressed instructions, as ratified in
   110	            the 20191213 version of the unprivileged ISA specification.
   111	
   112	        - const: v
   113	          description:
   114	            The standard V extension for vector operations, as ratified
   115	            in-and-around commit 7a6c8ae ("Fix text that describes vfmv.v.f
   116	            encoding") of the riscv-v-spec.
   117	
   118	        - const: h
   119	          description:
   120	            The standard H extension for hypervisors as ratified in the 20191213
   121	            version of the privileged ISA specification.
   122	
   123	        # multi-letter extensions, sorted alphanumerically
   124	        - const: smaia
   125	          description: |
   126	            The standard Smaia supervisor-level extension for the advanced
   127	            interrupt architecture for machine-mode-visible csr and behavioural
   128	            changes to interrupts as frozen at commit ccbddab ("Merge pull
   129	            request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
   130	
   131	        - const: smstateen
   132	          description: |
   133	            The standard Smstateen extension for controlling access to CSRs
   134	            added by other RISC-V extensions in H/S/VS/U/VU modes and as
   135	            ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
   136	
 > 137		- const: smcsrind
   138	          description: |
   139	            The standard Smcsrind supervisor-level extension extends the
   140		    indirect CSR access mechanism defined by the Smaia extension. This
   141		    extension allows other ISA extension to use indirect CSR access
   142		    mechanism in M-mode.
   143	
   144		- const: sscsrind
   145	          description: |
   146	            The standard Sscsrind supervisor-level extension extends the
   147		    indirect CSR access mechanism defined by the Ssaia extension. This
   148		    extension allows other ISA extension to use indirect CSR access
   149		    mechanism in S-mode.
   150	
   151	        - const: ssaia
   152	          description: |
   153	            The standard Ssaia supervisor-level extension for the advanced
   154	            interrupt architecture for supervisor-mode-visible csr and
   155	            behavioural changes to interrupts as frozen at commit ccbddab
   156	            ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
   157	
   158	        - const: sscofpmf
   159	          description: |
   160	            The standard Sscofpmf supervisor-level extension for count overflow
   161	            and mode-based filtering as ratified at commit 01d1df0 ("Add ability
   162	            to manually trigger workflow. (#2)") of riscv-count-overflow.
   163	
   164	        - const: sstc
   165	          description: |
   166	            The standard Sstc supervisor-level extension for time compare as
   167	            ratified at commit 3f9ed34 ("Add ability to manually trigger
   168	            workflow. (#2)") of riscv-time-compare.
   169	
   170	        - const: svinval
   171	          description:
   172	            The standard Svinval supervisor-level extension for fine-grained
   173	            address-translation cache invalidation as ratified in the 20191213
   174	            version of the privileged ISA specification.
   175	
   176	        - const: svnapot
   177	          description:
   178	            The standard Svnapot supervisor-level extensions for napot
   179	            translation contiguity as ratified in the 20191213 version of the
   180	            privileged ISA specification.
   181	
   182	        - const: svpbmt
   183	          description:
   184	            The standard Svpbmt supervisor-level extensions for page-based
   185	            memory types as ratified in the 20191213 version of the privileged
   186	            ISA specification.
   187	
   188	        - const: zacas
   189	          description: |
   190	            The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
   191	            is supported as ratified at commit 5059e0ca641c ("update to
   192	            ratified") of the riscv-zacas.
   193	
   194	        - const: zba
   195	          description: |
   196	            The standard Zba bit-manipulation extension for address generation
   197	            acceleration instructions as ratified at commit 6d33919 ("Merge pull
   198	            request #158 from hirooih/clmul-fix-loop-end-condition") of
   199	            riscv-bitmanip.
   200	
   201	        - const: zbb
   202	          description: |
   203	            The standard Zbb bit-manipulation extension for basic bit-manipulation
   204	            as ratified at commit 6d33919 ("Merge pull request #158 from
   205	            hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
   206	
   207	        - const: zbc
   208	          description: |
   209	            The standard Zbc bit-manipulation extension for carry-less
   210	            multiplication as ratified at commit 6d33919 ("Merge pull request
   211	            #158 from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
   212	
   213	        - const: zbkb
   214	          description:
   215	            The standard Zbkb bitmanip instructions for cryptography as ratified
   216	            in version 1.0 of RISC-V Cryptography Extensions Volume I
   217	            specification.
   218	
   219	        - const: zbkc
   220	          description:
   221	            The standard Zbkc carry-less multiply instructions as ratified
   222	            in version 1.0 of RISC-V Cryptography Extensions Volume I
   223	            specification.
   224	
   225	        - const: zbkx
   226	          description:
   227	            The standard Zbkx crossbar permutation instructions as ratified
   228	            in version 1.0 of RISC-V Cryptography Extensions Volume I
   229	            specification.
   230	
   231	        - const: zbs
   232	          description: |
   233	            The standard Zbs bit-manipulation extension for single-bit
   234	            instructions as ratified at commit 6d33919 ("Merge pull request #158
   235	            from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
   236	
   237	        - const: zfa
   238	          description:
   239	            The standard Zfa extension for additional floating point
   240	            instructions, as ratified in commit 056b6ff ("Zfa is ratified") of
   241	            riscv-isa-manual.
   242	
   243	        - const: zfh
   244	          description:
   245	            The standard Zfh extension for 16-bit half-precision binary
   246	            floating-point instructions, as ratified in commit 64074bc ("Update
   247	            version numbers for Zfh/Zfinx") of riscv-isa-manual.
   248	
   249	        - const: zfhmin
   250	          description:
   251	            The standard Zfhmin extension which provides minimal support for
   252	            16-bit half-precision binary floating-point instructions, as ratified
   253	            in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
   254	            riscv-isa-manual.
   255	
   256	        - const: zk
   257	          description:
   258	            The standard Zk Standard Scalar cryptography extension as ratified
   259	            in version 1.0 of RISC-V Cryptography Extensions Volume I
   260	            specification.
   261	
   262	        - const: zkn
   263	          description:
   264	            The standard Zkn NIST algorithm suite extensions as ratified in
   265	            version 1.0 of RISC-V Cryptography Extensions Volume I
   266	            specification.
   267	
   268	        - const: zknd
   269	          description: |
   270	            The standard Zknd for NIST suite: AES decryption instructions as
   271	            ratified in version 1.0 of RISC-V Cryptography Extensions Volume I
   272	            specification.
   273	
   274	        - const: zkne
   275	          description: |
   276	            The standard Zkne for NIST suite: AES encryption instructions as
   277	            ratified in version 1.0 of RISC-V Cryptography Extensions Volume I
   278	            specification.
   279	
   280	        - const: zknh
   281	          description: |
   282	            The standard Zknh for NIST suite: hash function instructions as
   283	            ratified in version 1.0 of RISC-V Cryptography Extensions Volume I
   284	            specification.
   285	
   286	        - const: zkr
   287	          description:
   288	            The standard Zkr entropy source extension as ratified in version
   289	            1.0 of RISC-V Cryptography Extensions Volume I specification.
   290	            This string being present means that the CSR associated to this
   291	            extension is accessible at the privilege level to which that
   292	            device-tree has been provided.
   293	
   294	        - const: zks
   295	          description:
   296	            The standard Zks ShangMi algorithm suite extensions as ratified in
   297	            version 1.0 of RISC-V Cryptography Extensions Volume I
   298	            specification.
   299	
   300	        - const: zksed
   301	          description: |
   302	            The standard Zksed for ShangMi suite: SM4 block cipher instructions
   303	            as ratified in version 1.0 of RISC-V Cryptography Extensions
   304	            Volume I specification.
   305	
   306	        - const: zksh
   307	          description: |
   308	            The standard Zksh for ShangMi suite: SM3 hash function instructions
   309	            as ratified in version 1.0 of RISC-V Cryptography Extensions
   310	            Volume I specification.
   311	
   312	        - const: zkt
   313	          description:
   314	            The standard Zkt for data independent execution latency as ratified
   315	            in version 1.0 of RISC-V Cryptography Extensions Volume I
   316	            specification.
   317	
   318	        - const: zicbom
   319	          description:
   320	            The standard Zicbom extension for base cache management operations as
   321	            ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
   322	
   323	        - const: zicbop
   324	          description:
   325	            The standard Zicbop extension for cache-block prefetch instructions
   326	            as ratified in commit 3dd606f ("Create cmobase-v1.0.pdf") of
   327	            riscv-CMOs.
   328	
   329	        - const: zicboz
   330	          description:
   331	            The standard Zicboz extension for cache-block zeroing as ratified
   332	            in commit 3dd606f ("Create cmobase-v1.0.pdf") of riscv-CMOs.
   333	
   334	        - const: zicntr
   335	          description:
   336	            The standard Zicntr extension for base counters and timers, as
   337	            ratified in the 20191213 version of the unprivileged ISA
   338	            specification.
   339	
   340	        - const: zicond
   341	          description:
   342	            The standard Zicond extension for conditional arithmetic and
   343	            conditional-select/move operations as ratified in commit 95cf1f9
   344	            ("Add changes requested by Ved during signoff") of riscv-zicond.
   345	
   346	        - const: zicsr
   347	          description: |
   348	            The standard Zicsr extension for control and status register
   349	            instructions, as ratified in the 20191213 version of the
   350	            unprivileged ISA specification.
   351	
   352	            This does not include Chapter 10, "Counters", which documents
   353	            special case read-only CSRs, that were moved into the Zicntr and
   354	            Zihpm extensions after the ratification of the 20191213 version of
   355	            the unprivileged specification.
   356	
   357	        - const: zifencei
   358	          description:
   359	            The standard Zifencei extension for instruction-fetch fence, as
   360	            ratified in the 20191213 version of the unprivileged ISA
   361	            specification.
   362	
   363	        - const: zihintpause
   364	          description:
   365	            The standard Zihintpause extension for pause hints, as ratified in
   366	            commit d8ab5c7 ("Zihintpause is ratified") of the riscv-isa-manual.
   367	
   368	        - const: zihintntl
   369	          description:
   370	            The standard Zihintntl extension for non-temporal locality hints, as
   371	            ratified in commit 0dc91f5 ("Zihintntl is ratified") of the
   372	            riscv-isa-manual.
   373	
   374	        - const: zihpm
   375	          description:
   376	            The standard Zihpm extension for hardware performance counters, as
   377	            ratified in the 20191213 version of the unprivileged ISA
   378	            specification.
   379	
   380	        - const: ztso
   381	          description:
   382	            The standard Ztso extension for total store ordering, as ratified
   383	            in commit 2e5236 ("Ztso is now ratified.") of the
   384	            riscv-isa-manual.
   385	
   386	        - const: zvbb
   387	          description:
   388	            The standard Zvbb extension for vectored basic bit-manipulation
   389	            instructions, as ratified in commit 56ed795 ("Update
   390	            riscv-crypto-spec-vector.adoc") of riscv-crypto.
   391	
   392	        - const: zvbc
   393	          description:
   394	            The standard Zvbc extension for vectored carryless multiplication
   395	            instructions, as ratified in commit 56ed795 ("Update
   396	            riscv-crypto-spec-vector.adoc") of riscv-crypto.
   397	
   398	        - const: zvfh
   399	          description:
   400	            The standard Zvfh extension for vectored half-precision
   401	            floating-point instructions, as ratified in commit e2ccd05
   402	            ("Remove draft warnings from Zvfh[min]") of riscv-v-spec.
   403	
   404	        - const: zvfhmin
   405	          description:
   406	            The standard Zvfhmin extension for vectored minimal half-precision
   407	            floating-point instructions, as ratified in commit e2ccd05
   408	            ("Remove draft warnings from Zvfh[min]") of riscv-v-spec.
   409	
   410	        - const: zvkb
   411	          description:
   412	            The standard Zvkb extension for vector cryptography bit-manipulation
   413	            instructions, as ratified in commit 56ed795 ("Update
   414	            riscv-crypto-spec-vector.adoc") of riscv-crypto.
   415	
   416	        - const: zvkg
   417	          description:
   418	            The standard Zvkg extension for vector GCM/GMAC instructions, as
   419	            ratified in commit 56ed795 ("Update riscv-crypto-spec-vector.adoc")
   420	            of riscv-crypto.
   421	
   422	        - const: zvkn
   423	          description:
   424	            The standard Zvkn extension for NIST algorithm suite instructions, as
   425	            ratified in commit 56ed795 ("Update riscv-crypto-spec-vector.adoc")
   426	            of riscv-crypto.
   427	
   428	        - const: zvknc
   429	          description:
   430	            The standard Zvknc extension for NIST algorithm suite with carryless
   431	            multiply instructions, as ratified in commit 56ed795 ("Update
   432	            riscv-crypto-spec-vector.adoc") of riscv-crypto.
   433	
   434	        - const: zvkned
   435	          description:
   436	            The standard Zvkned extension for Vector AES block cipher
   437	            instructions, as ratified in commit 56ed795 ("Update
   438	            riscv-crypto-spec-vector.adoc") of riscv-crypto.
   439	
   440	        - const: zvkng
   441	          description:
   442	            The standard Zvkng extension for NIST algorithm suite with GCM
   443	            instructions, as ratified in commit 56ed795 ("Update
   444	            riscv-crypto-spec-vector.adoc") of riscv-crypto.
   445	
   446	        - const: zvknha
   447	          description: |
   448	            The standard Zvknha extension for NIST suite: vector SHA-2 secure,
   449	            hash (SHA-256 only) instructions, as ratified in commit
   450	            56ed795 ("Update riscv-crypto-spec-vector.adoc") of riscv-crypto.
   451	
   452	        - const: zvknhb
   453	          description: |
   454	            The standard Zvknhb extension for NIST suite: vector SHA-2 secure,
   455	            hash (SHA-256 and SHA-512) instructions, as ratified in commit
   456	            56ed795 ("Update riscv-crypto-spec-vector.adoc") of riscv-crypto.
   457	
   458	        - const: zvks
   459	          description:
   460	            The standard Zvks extension for ShangMi algorithm suite
   461	            instructions, as ratified in commit 56ed795 ("Update
   462	            riscv-crypto-spec-vector.adoc") of riscv-crypto.
   463	
   464	        - const: zvksc
   465	          description:
   466	            The standard Zvksc extension for ShangMi algorithm suite with
   467	            carryless multiplication instructions, as ratified in commit 56ed795
   468	            ("Update riscv-crypto-spec-vector.adoc") of riscv-crypto.
   469	
   470	        - const: zvksed
   471	          description: |
   472	            The standard Zvksed extension for ShangMi suite: SM4 block cipher
   473	            instructions, as ratified in commit 56ed795 ("Update
   474	            riscv-crypto-spec-vector.adoc") of riscv-crypto.
   475	
   476	        - const: zvksh
   477	          description: |
   478	            The standard Zvksh extension for ShangMi suite: SM3 secure hash
   479	            instructions, as ratified in commit 56ed795 ("Update
   480	            riscv-crypto-spec-vector.adoc") of riscv-crypto.
   481	
   482	        - const: zvksg
   483	          description:
   484	            The standard Zvksg extension for ShangMi algorithm suite with GCM
   485	            instructions, as ratified in commit 56ed795 ("Update
   486	            riscv-crypto-spec-vector.adoc") of riscv-crypto.
   487	
   488	        - const: zvkt
   489	          description:
   490	            The standard Zvkt extension for vector data-independent execution
   491	            latency, as ratified in commit 56ed795 ("Update
   492	            riscv-crypto-spec-vector.adoc") of riscv-crypto.
   493	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
