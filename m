Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1371C6A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Aug 2024 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724141011; cv=none; b=FNOswSsQXy4ESHbYYFEW0t2VNZRLsGusN4AwZf5bZzjHlAV5k0hRy7lQdLHmEvAnxsrCl25X0BsB4YzR3KyezyxLB1QYVGUw7EOVgm2UH3y3b0UaC+oe2G7kFu7Eh5d/PkZPQjHgL18QzhF85mNfUOIlXpfPu9VN6G5wYQIJi1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724141011; c=relaxed/simple;
	bh=0BQRMn2iq5py+pyV5ZFgCOVX4sHafSCNgulGe91HtT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pK9Tbp8i/uGGHCMiA1p87xkLN8g3uR6JbxhIk1eeQwvYihIOxHbk6hy1yEqOxCJLZeaf9skToB8FvPmLh9D8VpkIfkI3xncNg02TgQzZpYmVQ3PmwrHS0/oLlNrxabCYhtDPUKy1wrOoMsALUZPNQpAt64QGc0biIP9ZPbyu5Yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9sS5AdB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9sS5AdB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724141010; x=1755677010;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0BQRMn2iq5py+pyV5ZFgCOVX4sHafSCNgulGe91HtT8=;
  b=Z9sS5AdBbTLkmNVi05cfjYBWblrx0zT1dTbN17KLNmrmFwnkz68GLE0U
   oOG2pplWu/oWG4UWK+7erWKT+AoUN4/KUoOT/xOF4Ksn9yLK6gRgqSoKM
   9BsRZzZbqXMryW7UN4eDrWaA8TuCPca3OEa01pabUu0kBZ57Q/XoAnJeE
   MkF8NrYsPO0+/X4O+qPvYbvq7RB2fGsUic7FJiLQRu34UFdCGq8H9AbhX
   P1kG12qblrf2d5SsAo8CP5XLddbA3Et5UvB3UsKQTx3yLFgsCNX4Pg9wb
   Gbu/HBgpPYE0SFFh6mku/j6+lJjW5ZWn2ZKfRwjn0ju1sFtNl5wiBUnBT
   Q==;
X-CSE-ConnectionGUID: my+H75bwTg2AawGg6qmdLQ==
X-CSE-MsgGUID: vpa0GbZ/R6Wr5INq3WyVlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="33844995"
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="33844995"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 01:03:29 -0700
X-CSE-ConnectionGUID: EdumMx0DSnOLEqsw4ZYbAA==
X-CSE-MsgGUID: aAK/GSw9Q3aAxXa3Z2NsGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,161,1719903600"; 
   d="scan'208";a="60624940"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Aug 2024 01:03:22 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgJpo-0009sh-0P;
	Tue, 20 Aug 2024 08:03:20 +0000
Date: Tue, 20 Aug 2024 16:02:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>, linux-riscv@lists.infradead.org
Cc: oe-kbuild-all@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>
Subject: Re: [PATCH v8 4/6] RISC-V: Detect unaligned vector accesses supported
Message-ID: <202408201543.4MIUQPd7-lkp@intel.com>
References: <20240819212605.1837175-5-jesse@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240819212605.1837175-5-jesse@rivosinc.com>

Hi Jesse,

kernel test robot noticed the following build errors:

[auto build test ERROR on 32d5f7add080a936e28ab4142bfeea6b06999789]

url:    https://github.com/intel-lab-lkp/linux/commits/Jesse-Taube/RISC-V-Check-scalar-unaligned-access-on-all-CPUs/20240820-052900
base:   32d5f7add080a936e28ab4142bfeea6b06999789
patch link:    https://lore.kernel.org/r/20240819212605.1837175-5-jesse%40rivosinc.com
patch subject: [PATCH v8 4/6] RISC-V: Detect unaligned vector accesses supported
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240820/202408201543.4MIUQPd7-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408201543.4MIUQPd7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408201543.4MIUQPd7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/sys_hwprobe.c: In function 'hwprobe_one_pair':
>> arch/riscv/kernel/sys_hwprobe.c:263:14: error: 'RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF' undeclared (first use in this function)
     263 |         case RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF:
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/sys_hwprobe.c:263:14: note: each undeclared identifier is reported only once for each function it appears in


vim +/RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF +263 arch/riscv/kernel/sys_hwprobe.c

   234	
   235	static void hwprobe_one_pair(struct riscv_hwprobe *pair,
   236				     const struct cpumask *cpus)
   237	{
   238		switch (pair->key) {
   239		case RISCV_HWPROBE_KEY_MVENDORID:
   240		case RISCV_HWPROBE_KEY_MARCHID:
   241		case RISCV_HWPROBE_KEY_MIMPID:
   242			hwprobe_arch_id(pair, cpus);
   243			break;
   244		/*
   245		 * The kernel already assumes that the base single-letter ISA
   246		 * extensions are supported on all harts, and only supports the
   247		 * IMA base, so just cheat a bit here and tell that to
   248		 * userspace.
   249		 */
   250		case RISCV_HWPROBE_KEY_BASE_BEHAVIOR:
   251			pair->value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA;
   252			break;
   253	
   254		case RISCV_HWPROBE_KEY_IMA_EXT_0:
   255			hwprobe_isa_ext0(pair, cpus);
   256			break;
   257	
   258		case RISCV_HWPROBE_KEY_CPUPERF_0:
   259		case RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF:
   260			pair->value = hwprobe_misaligned(cpus);
   261			break;
   262	
 > 263		case RISCV_HWPROBE_KEY_VECTOR_MISALIGNED_PERF:
   264			pair->value = hwprobe_vec_misaligned(cpus);
   265			break;
   266	
   267		case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
   268			pair->value = 0;
   269			if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
   270				pair->value = riscv_cboz_block_size;
   271			break;
   272		case RISCV_HWPROBE_KEY_HIGHEST_VIRT_ADDRESS:
   273			pair->value = user_max_virt_addr();
   274			break;
   275	
   276		case RISCV_HWPROBE_KEY_TIME_CSR_FREQ:
   277			pair->value = riscv_timebase;
   278			break;
   279	
   280		/*
   281		 * For forward compatibility, unknown keys don't fail the whole
   282		 * call, but get their element key set to -1 and value set to 0
   283		 * indicating they're unrecognized.
   284		 */
   285		default:
   286			pair->key = -1;
   287			pair->value = 0;
   288			break;
   289		}
   290	}
   291	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
