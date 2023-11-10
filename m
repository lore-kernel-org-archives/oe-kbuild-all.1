Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD80915B9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Nov 2023 07:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVHv5iop"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699600694; x=1731136694;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NF0h8QzfztbFfHhC9cK2K5o6pamjC/MGDzjiJJkHWtk=;
  b=EVHv5iop35qU98aeAI7jJKr1Lqjage8zgZWZ+VSzQX230MAVmhb4+j1A
   q1ZJi5HWAJZOga/X+lCvJkmNl+ryTLCVn6l9LwfaoMxnT1V1C2I5o3m7A
   zHeoFoNZDgcqJf7ZLEiuvUHNe8MyPFtmdko3Vs6Y6qWg4HhFJh1B0Yy47
   euGBhWJPALpo+UKgRtYg4wrpm753Z6MjRidUBYyHm57DvSFDvaZHlAIpa
   yaEYm6n6w1PZuS98JKMTrpYvNeDxksVQX7yb4O3AU/fRGb7g3GBLitQI0
   ifWtxtXvm4WQsGY+46+Qc/fgQy3sEAVOkpb1CBTCKJtFDNT4mPWq0Cvkk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="394051339"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="394051339"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 23:18:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="907397742"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="907397742"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2023 23:18:08 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1LmH-0009TW-2w;
	Fri, 10 Nov 2023 07:18:05 +0000
Date: Fri, 10 Nov 2023 15:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pratyush Brahma <quic_pbrahma@quicinc.com>,
	Tomas Mudrunka <tomas.mudrunka@gmail.com>,
	Sean Anderson <sean.anderson@seco.com>, x86@kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	xe-linux-external@cisco.com,
	Ruslan Ruslichenko <rruslich@cisco.com>,
	Ruslan Bilovol <ruslan.bilovol@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command line
Message-ID: <202311101507.q12gPUvS-lkp@intel.com>
References: <20231110013817.2378507-7-danielwa@cisco.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110013817.2378507-7-danielwa@cisco.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.6]
[cannot apply to arm64/for-next/core efi/next tip/x86/core robh/for-next linus/master next-20231110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Walker/CMDLINE-add-generic-builtin-command-line/20231110-094423
base:   v6.6
patch link:    https://lore.kernel.org/r/20231110013817.2378507-7-danielwa%40cisco.com
patch subject: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command line
config: x86_64-kismet-CONFIG_SYSTEM_EXTRA_CERTIFICATE-CONFIG_CMDLINE_EXTRA-0-0 (https://download.01.org/0day-ci/archive/20231110/202311101507.q12gPUvS-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231110/202311101507.q12gPUvS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311101507.q12gPUvS-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SYSTEM_EXTRA_CERTIFICATE when selected by CMDLINE_EXTRA
   
   WARNING: unmet direct dependencies detected for SYSTEM_EXTRA_CERTIFICATE
     Depends on [n]: CRYPTO [=y] && SYSTEM_TRUSTED_KEYRING [=n]
     Selected by [y]:
     - CMDLINE_EXTRA [=y] && GENERIC_CMDLINE [=y] && CMDLINE_BOOL [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
