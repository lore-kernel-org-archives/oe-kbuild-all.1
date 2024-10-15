Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4FA1D5AB2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Oct 2024 11:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728990369; cv=none; b=rHVfB7a9t2YvnYtqV+LypzC/Yg+KQYmaCthHoAUf3+mOJP7SeVrB7OLhBQxMHnxbsF5sYx292JFY1l5UMVc7HIza6dVDoyUPrOksasqltoEbhIzBnKIF+OTnp9f4HyUR28oxNbN7vsXVWSx9twG2w0yomhYRIR7YdneaxMGc/ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728990369; c=relaxed/simple;
	bh=Pg16ByItMJPVcLGJK175Zzik1c1YLvWigsny1vC9XfU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oqycAvoJ5EJr8SpCoLReiCRBf65hwI+/G57UPOACfvAJSHlB8owvBGfEU0P0wUva7fnNlEEvtJz0eacwOOnDx5OumWPYlHdlCUQB7belG88hQ1Vup9dOXN1cUTHIlc+iHtDUzuaZYWzG/+uFq0tmd3hH21B5s2niwZ5mAGoc7Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NZbW3cW/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NZbW3cW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728990368; x=1760526368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Pg16ByItMJPVcLGJK175Zzik1c1YLvWigsny1vC9XfU=;
  b=NZbW3cW/4j9x1xzy0GO6u6fThm9lsRrlZbSfuyUkUXccxc4keuVy+DIF
   Lsgevb45AzswFkcq4f+iU4fNoUzwIk93G3SBalzGU1yJPyrlL0zzlV8l5
   BWofLO/FGFrE5G5Mj1zvhkFDnvYClACEOvrX4C4zlzY9WN2ev7Fd93Zw9
   FhLeyZfjpCkiNZHBrTl4IoPJkXNVR134EWtwgMlNySkom+EuDJLUGeUly
   Pw9x+6HkhuW+hywpZVQD82jIfTdSpG1aGNIENuaMDvu8A2MOIWjw75BWT
   7PzqMCVcCWnP9hMvnsxAeKQBY0kUMF27VMzNk/Nifn2pl0Ob/eLpYmLdZ
   Q==;
X-CSE-ConnectionGUID: /3npMRgmRYOuLrqMOO9ZwQ==
X-CSE-MsgGUID: zlVlDbnYRiGaRpCsrUx8lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="16000029"
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="16000029"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 04:05:56 -0700
X-CSE-ConnectionGUID: J8FqnB8lTp+Vvc/ge+MtMw==
X-CSE-MsgGUID: 5lprZAhjT+akXkKmb4LJAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; 
   d="scan'208";a="78312581"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Oct 2024 04:05:48 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0fN4-000I0F-0F;
	Tue, 15 Oct 2024 11:05:46 +0000
Date: Tue, 15 Oct 2024 19:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: Alice Ryhl <aliceryhl@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-trace-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Sean Christopherson <seanjc@google.com>,
	Uros Bizjak <ubizjak@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v10 5/5] rust: add arch_static_branch
Message-ID: <202410151814.WmLlAkCq-lkp@intel.com>
References: <20241011-tracepoint-v10-5-7fbde4d6b525@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-tracepoint-v10-5-7fbde4d6b525@google.com>

Hi Alice,

kernel test robot noticed the following build errors:

[auto build test ERROR on eb887c4567d1b0e7684c026fe7df44afa96589e6]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-add-static_branch_unlikely-for-static_key_false/20241011-181703
base:   eb887c4567d1b0e7684c026fe7df44afa96589e6
patch link:    https://lore.kernel.org/r/20241011-tracepoint-v10-5-7fbde4d6b525%40google.com
patch subject: [PATCH v10 5/5] rust: add arch_static_branch
config: riscv-randconfig-r062-20241015 (https://download.01.org/0day-ci/archive/20241015/202410151814.WmLlAkCq-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410151814.WmLlAkCq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410151814.WmLlAkCq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 1: cannot create rust/kernel/arch_static_branch_asm.rs: Directory nonexistent
   make[3]: *** [scripts/Makefile.build:311: rust/kernel/arch_static_branch_asm.rs] Error 2
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1209: prepare] Error 2
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
