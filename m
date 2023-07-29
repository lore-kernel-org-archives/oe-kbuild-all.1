Received: from mgamail.intel.com (unknown [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5705A7C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 10:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690626442; x=1722162442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GDp5Sh1zPbJdLkbHcAggLj8Sv7RnuYMVlVwahIRRMBw=;
  b=Uq+teX1WulDeFB7XkzleOJlHmRuWe2K9Ly2rdLGbjBHBZwFVkHgysLT/
   azLr8WoLZqKfVRCl81T8omR026dQkzHWj8rs13kTJm45jTnYAosgTdsaZ
   SEDJl0CX1B4aWxQit1TIsvb1sfE5AkfU+fvHpN6m3qnp857g8x7eATDV7
   nlUfnRWojo0qMMW1pJrWEOcUI9y/WAp6T96G1K652QuH4gHF/6wMg3SBk
   kRXltwp616DgQSILfIQtTvwsONjd8tTsOANb76qmwrQoU26Qi2g2LtDVE
   RsEutTf+WN47QijCveuOIGUHgcvoj5AqT2zv9htg4PbOBVoFT0leSExnx
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="432559786"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="432559786"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2023 03:27:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="817782365"
X-IronPort-AV: E=Sophos;i="6.01,240,1684825200"; 
   d="scan'208";a="817782365"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 29 Jul 2023 03:27:19 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPhAN-0003yh-0k;
	Sat, 29 Jul 2023 10:27:19 +0000
Date: Sat, 29 Jul 2023 18:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
	linux-doc@vger.kernel.org
Subject: [bpf-next:master 19/30] htmldocs:
 Documentation/bpf/standardization/instruction-set.rst:157: WARNING:
 Malformed table.
Message-ID: <202307291840.Cqhj7uox-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
head:   eb03993a60780589e06e04a4dc23fda62b905ca6
commit: 245d4c40c09bd8d5a71640950eeb074880925b9a [19/30] docs/bpf: Add documentation for new instructions
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307291840.Cqhj7uox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307291840.Cqhj7uox-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/bpf/standardization/instruction-set.rst:157: WARNING: Malformed table.
>> Documentation/bpf/standardization/instruction-set.rst:354: WARNING: Unknown target name: "sign-extension load operations".

vim +157 Documentation/bpf/standardization/instruction-set.rst

   156	
 > 157	========  =====  =======  ==========================================================
   158	code      value  offset   description
   159	========  =====  =======  ==========================================================
   160	BPF_ADD   0x00   0        dst += src
   161	BPF_SUB   0x10   0        dst -= src
   162	BPF_MUL   0x20   0        dst \*= src
   163	BPF_DIV   0x30   0        dst = (src != 0) ? (dst / src) : 0
   164	BPF_SDIV  0x30   1        dst = (src != 0) ? (dst s/ src) : 0
   165	BPF_OR    0x40   0        dst \|= src
   166	BPF_AND   0x50   0        dst &= src
   167	BPF_LSH   0x60   0        dst <<= (src & mask)
   168	BPF_RSH   0x70   0        dst >>= (src & mask)
   169	BPF_NEG   0x80   0        dst = -dst
   170	BPF_MOD   0x90   0        dst = (src != 0) ? (dst % src) : dst
   171	BPF_SMOD  0x90   1        dst = (src != 0) ? (dst s% src) : dst
   172	BPF_XOR   0xa0   0        dst ^= src
   173	BPF_MOV   0xb0   0        dst = src
   174	BPF_MOVSX 0xb0   8/16/32  dst = (s8,s16,s32)src
   175	BPF_ARSH  0xc0   0        sign extending dst >>= (src & mask)
   176	BPF_END   0xd0   0        byte swap operations (see `Byte swap instructions`_ below)
   177	========  =====  ============  ==========================================================
   178	
   179	Underflow and overflow are allowed during arithmetic operations, meaning
   180	the 64-bit or 32-bit value will wrap. If eBPF program execution would
   181	result in division by zero, the destination register is instead set to zero.
   182	If execution would result in modulo by zero, for ``BPF_ALU64`` the value of
   183	the destination register is unchanged whereas for ``BPF_ALU`` the upper
   184	32 bits of the destination register are zeroed.
   185	
   186	``BPF_ADD | BPF_X | BPF_ALU`` means::
   187	
   188	  dst = (u32) ((u32) dst + (u32) src)
   189	
   190	where '(u32)' indicates that the upper 32 bits are zeroed.
   191	
   192	``BPF_ADD | BPF_X | BPF_ALU64`` means::
   193	
   194	  dst = dst + src
   195	
   196	``BPF_XOR | BPF_K | BPF_ALU`` means::
   197	
   198	  dst = (u32) dst ^ (u32) imm32
   199	
   200	``BPF_XOR | BPF_K | BPF_ALU64`` means::
   201	
   202	  dst = dst ^ imm32
   203	
   204	Note that most instructions have instruction offset of 0. But three instructions
   205	(BPF_SDIV, BPF_SMOD, BPF_MOVSX) have non-zero offset.
   206	
   207	The devision and modulo operations support both unsigned and signed flavors.
   208	For unsigned operation (BPF_DIV and BPF_MOD), for ``BPF_ALU``, 'imm' is first
   209	interpreted as an unsigned 32-bit value, whereas for ``BPF_ALU64``, 'imm' is
   210	first sign extended to 64 bits and the result interpreted as an unsigned 64-bit
   211	value.  For signed operation (BPF_SDIV and BPF_SMOD), for ``BPF_ALU``, 'imm' is
   212	interpreted as a signed value. For ``BPF_ALU64``, the 'imm' is sign extended
   213	from 32 to 64 and interpreted as a signed 64-bit value.
   214	
   215	Instruction BPF_MOVSX does move operation with sign extension.
   216	``BPF_ALU | MOVSX`` sign extendes 8-bit and 16-bit into 32-bit and upper 32-bit are zeroed.
   217	``BPF_ALU64 | MOVSX`` sign extends 8-bit, 16-bit and 32-bit into 64-bit.
   218	
   219	Shift operations use a mask of 0x3F (63) for 64-bit operations and 0x1F (31)
   220	for 32-bit operations.
   221	
   222	Byte swap instructions
   223	~~~~~~~~~~~~~~~~~~~~~~
   224	
   225	The byte swap instructions use instruction classes of ``BPF_ALU`` and ``BPF_ALU64``
   226	and a 4-bit 'code' field of ``BPF_END``.
   227	
   228	The byte swap instructions operate on the destination register
   229	only and do not use a separate source register or immediate value.
   230	
   231	For ``BPF_ALU``, the 1-bit source operand field in the opcode is used to select what byte
   232	order the operation convert from or to. For ``BPF_ALU64``, the 1-bit source operand
   233	field in the opcode is not used and must be 0.
   234	
   235	=========  =========  =====  =================================================
   236	class      source     value  description
   237	=========  =========  =====  =================================================
   238	BPF_ALU    BPF_TO_LE  0x00   convert between host byte order and little endian
   239	BPF_ALU    BPF_TO_BE  0x08   convert between host byte order and big endian
   240	BPF_ALU64  BPF_TO_LE  0x00   do byte swap unconditionally
   241	=========  =========  =====  =================================================
   242	
   243	The 'imm' field encodes the width of the swap operations.  The following widths
   244	are supported: 16, 32 and 64.
   245	
   246	Examples:
   247	
   248	``BPF_ALU | BPF_TO_LE | BPF_END`` with imm = 16 means::
   249	
   250	  dst = htole16(dst)
   251	
   252	``BPF_ALU | BPF_TO_BE | BPF_END`` with imm = 64 means::
   253	
   254	  dst = htobe64(dst)
   255	
   256	``BPF_ALU64 | BPF_TO_LE | BPF_END`` with imm = 16/32/64 means::
   257	
   258	  dst = bswap16 dst
   259	  dst = bswap32 dst
   260	  dst = bswap64 dst
   261	
   262	Jump instructions
   263	-----------------
   264	
   265	``BPF_JMP32`` uses 32-bit wide operands while ``BPF_JMP`` uses 64-bit wide operands for
   266	otherwise identical operations.
   267	The 'code' field encodes the operation as below:
   268	
   269	========  =====  ===  ===========================================  =========================================
   270	code      value  src  description                                  notes
   271	========  =====  ===  ===========================================  =========================================
   272	BPF_JA    0x0    0x0  PC += offset                                 BPF_JMP class
   273	BPF_JA    0x0    0x0  PC += imm                                    BPF_JMP32 class
   274	BPF_JEQ   0x1    any  PC += offset if dst == src
   275	BPF_JGT   0x2    any  PC += offset if dst > src                    unsigned
   276	BPF_JGE   0x3    any  PC += offset if dst >= src                   unsigned
   277	BPF_JSET  0x4    any  PC += offset if dst & src
   278	BPF_JNE   0x5    any  PC += offset if dst != src
   279	BPF_JSGT  0x6    any  PC += offset if dst > src                    signed
   280	BPF_JSGE  0x7    any  PC += offset if dst >= src                   signed
   281	BPF_CALL  0x8    0x0  call helper function by address              see `Helper functions`_
   282	BPF_CALL  0x8    0x1  call PC += offset                            see `Program-local functions`_
   283	BPF_CALL  0x8    0x2  call helper function by BTF ID               see `Helper functions`_
   284	BPF_EXIT  0x9    0x0  return                                       BPF_JMP only
   285	BPF_JLT   0xa    any  PC += offset if dst < src                    unsigned
   286	BPF_JLE   0xb    any  PC += offset if dst <= src                   unsigned
   287	BPF_JSLT  0xc    any  PC += offset if dst < src                    signed
   288	BPF_JSLE  0xd    any  PC += offset if dst <= src                   signed
   289	========  =====  ===  ===========================================  =========================================
   290	
   291	The eBPF program needs to store the return value into register R0 before doing a
   292	``BPF_EXIT``.
   293	
   294	Example:
   295	
   296	``BPF_JSGE | BPF_X | BPF_JMP32`` (0x7e) means::
   297	
   298	  if (s32)dst s>= (s32)src goto +offset
   299	
   300	where 's>=' indicates a signed '>=' comparison.
   301	
   302	``BPF_JA | BPF_K | BPF_JMP32`` (0x06) means::
   303	
   304	  gotol +imm
   305	
   306	where 'imm' means the branch offset comes from insn 'imm' field.
   307	
   308	Note there are two flavors of BPF_JA instrions. BPF_JMP class permits 16-bit jump offset while
   309	BPF_JMP32 permits 32-bit jump offset. A >16bit conditional jmp can be converted to a <16bit
   310	conditional jmp plus a 32-bit unconditional jump.
   311	
   312	Helper functions
   313	~~~~~~~~~~~~~~~~
   314	
   315	Helper functions are a concept whereby BPF programs can call into a
   316	set of function calls exposed by the underlying platform.
   317	
   318	Historically, each helper function was identified by an address
   319	encoded in the imm field.  The available helper functions may differ
   320	for each program type, but address values are unique across all program types.
   321	
   322	Platforms that support the BPF Type Format (BTF) support identifying
   323	a helper function by a BTF ID encoded in the imm field, where the BTF ID
   324	identifies the helper name and type.
   325	
   326	Program-local functions
   327	~~~~~~~~~~~~~~~~~~~~~~~
   328	Program-local functions are functions exposed by the same BPF program as the
   329	caller, and are referenced by offset from the call instruction, similar to
   330	``BPF_JA``.  A ``BPF_EXIT`` within the program-local function will return to
   331	the caller.
   332	
   333	Load and store instructions
   334	===========================
   335	
   336	For load and store instructions (``BPF_LD``, ``BPF_LDX``, ``BPF_ST``, and ``BPF_STX``), the
   337	8-bit 'opcode' field is divided as:
   338	
   339	============  ======  =================
   340	3 bits (MSB)  2 bits  3 bits (LSB)
   341	============  ======  =================
   342	mode          size    instruction class
   343	============  ======  =================
   344	
   345	The mode modifier is one of:
   346	
   347	  =============  =====  ====================================  =============
   348	  mode modifier  value  description                           reference
   349	  =============  =====  ====================================  =============
   350	  BPF_IMM        0x00   64-bit immediate instructions         `64-bit immediate instructions`_
   351	  BPF_ABS        0x20   legacy BPF packet access (absolute)   `Legacy BPF Packet access instructions`_
   352	  BPF_IND        0x40   legacy BPF packet access (indirect)   `Legacy BPF Packet access instructions`_
   353	  BPF_MEM        0x60   regular load and store operations     `Regular load and store operations`_
 > 354	  BPF_MEMSX      0x80   sign-extension load operations        `Sign-extension load operations`_
   355	  BPF_ATOMIC     0xc0   atomic operations                     `Atomic operations`_
   356	  =============  =====  ====================================  =============
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
