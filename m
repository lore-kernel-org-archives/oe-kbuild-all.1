Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61093175D5D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Oct 2024 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729838876; cv=none; b=HAajXjFgb939i9PSVsBjmmY8JaGOryayQQySSBxu5iZeeKiYgxk5nbIoAX1ZZJEiZ4WwxpQ/0R/INklYpKf8oyJNLncZ/QdzbjGM0eA9Ug/Rrz8Pid9i5C1vSLeuTgfEWL7WaE2XOms2boYRIntYDgcmkyWSiAWKnrTKRyMRt+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729838876; c=relaxed/simple;
	bh=QxG45yfFNsxB14BXHLWPekobBvbo9RrVsjBW/dquxFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s21n2uPP0tgQnSc+ZXebU3SeWsnd/7hPeyjyaSAdr8VdxpuoT1puaNWDItEoQ04iA8ZFyK8H9gRTUKsNoU6r0RctBJGVasLYgSAf/bKaFEAJtoX5/G69vfGFJCryrjOa6y3wylgquSWTVPF1/ksmX8xjACC8gRQ/1aVtlvw+muo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ICeXD057; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ICeXD057"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729838874; x=1761374874;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QxG45yfFNsxB14BXHLWPekobBvbo9RrVsjBW/dquxFk=;
  b=ICeXD0575rktHUE0w4b/E/nQTxNbiKG/EvQ6xvz5UAwrdvdHt0FA0xvM
   N5cpaV2Zv3gHHVVKt3ZBIJK5JrXO1noVza8ksQSLMYrn3UyHES1SMlRR5
   NfJdSi8vpDXFR9LG+UYpuKKdXV7s6dv33aPOlguq1KdAgE6eh/Nvr5HE+
   vuI58BArzJvz92xMvQ4O95z+zciejRbSE5loD9KVUxUn7fNpt/W9pD1Q2
   //+qS6UWKcoKQQ/Bi8P8EBIbzTlZZ1MyUpNBgBWsautd+PONa7o+/OnDp
   J/v+YhuHEUd4RNp1zst8cJ7YYutV2xRAiDyv2S7ThaZFhQfSD4pDW5/cs
   A==;
X-CSE-ConnectionGUID: riTgw0SDT/60GUNxZxXtKQ==
X-CSE-MsgGUID: Ssi4TThhREKdE5A7ushqWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="28939759"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="28939759"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 23:47:53 -0700
X-CSE-ConnectionGUID: WivFZ3TQSQeP+GRxeZa0RA==
X-CSE-MsgGUID: GfQ2/omYS6GQIySc1OoKfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="85935630"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Oct 2024 23:47:46 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4E6p-000XjY-22;
	Fri, 25 Oct 2024 06:47:43 +0000
Date: Fri, 25 Oct 2024 14:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>, Alice Ryhl <aliceryhl@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>, Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>, Breno Leitao <leitao@debian.org>,
	Brian Gerst <brgerst@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Li <davidxl@google.com>, Han Shen <shenhan@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>, Jonathan Corbet <corbet@lwn.net>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Juergen Gross <jgross@suse.com>,
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: Re: [PATCH v5 3/7] Change the symbols order when
 --ffunction-sections is enabled
Message-ID: <202410251411.eRNArTOZ-lkp@intel.com>
References: <20241023224409.201771-4-xur@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023224409.201771-4-xur@google.com>

Hi Rong,

kernel test robot noticed the following build errors:

[auto build test ERROR on eb952c47d154ba2aac794b99c66c3c45eb4cc4ec]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Xu/Add-AutoFDO-support-for-Clang-build/20241024-064725
base:   eb952c47d154ba2aac794b99c66c3c45eb4cc4ec
patch link:    https://lore.kernel.org/r/20241023224409.201771-4-xur%40google.com
patch subject: [PATCH v5 3/7] Change the symbols order when --ffunction-sections is enabled
config: sparc-sparc64_defconfig (https://download.01.org/0day-ci/archive/20241025/202410251411.eRNArTOZ-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241025/202410251411.eRNArTOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410251411.eRNArTOZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sparc64-linux-ld: Error: sparc64 early assembler too large

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
