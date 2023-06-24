Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6967D360
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 00:26:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687566387; x=1719102387;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=31YNRBmOki2uDFgedBECKlRElQKPWji8PoV4bItAMvU=;
  b=HXDfbTN/d3/daBbZUiuOu/5Ck2a1V1QNi8tOS79b2Kw5rXP7ABJV6UmY
   F2/Hj5FsZGMM1vq8MwDu9FwPG20/2R+OzpThoj53ehirloM3u79jNw4BX
   O2rm/m4pz+tzFkk/NocMSA8falv/uifaw1km+p2V+KA0u9wwXquap8Bui
   JiV4fLJDmCkWn3sbPxsP5Z8Kjq6cY0wx2lfayk5GeNlJ+JrqNxIG07zMG
   j4uzHU5HvFq1H+zH+qiqupBk78NadNuzS0YO4lSlAZvaDbqEnAtJxwcb4
   8FPtV7dny6ijdwaIUTPTd5W79FE8rYJbbxadeacLX8Ku4cGjqh/p1NEku
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="359759359"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="359759359"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 17:26:26 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="750128385"
X-IronPort-AV: E=Sophos;i="6.01,153,1684825200"; 
   d="scan'208";a="750128385"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Jun 2023 17:26:22 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCr6b-0008bh-0r;
	Sat, 24 Jun 2023 00:26:21 +0000
Date: Sat, 24 Jun 2023 08:26:03 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Song Shuai <songshuaishuai@tinylab.org>, linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v3 2/3] Documentation: riscv: Add early boot document
Message-ID: <202306240844.hWqCe54e-lkp@intel.com>
References: <20230623095547.51881-2-alexghiti@rivosinc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623095547.51881-2-alexghiti@rivosinc.com>

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.4-rc7]
[also build test WARNING on linus/master next-20230623]
[cannot apply to lwn/docs-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/Documentation-riscv-Add-early-boot-document/20230623-175814
base:   v6.4-rc7
patch link:    https://lore.kernel.org/r/20230623095547.51881-2-alexghiti%40rivosinc.com
patch subject: [PATCH v3 2/3] Documentation: riscv: Add early boot document
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240844.hWqCe54e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306240844.hWqCe54e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/riscv/boot.rst:122: WARNING: Unknown interpreted text role "c:var".

vim +122 Documentation/riscv/boot.rst

   121	
 > 122	1. :c:func:`setup_vm` installs a temporary kernel mapping in
   123	   :c:var:`early_pg_dir` which allows discovery of the system memory. Only the
   124	   kernel text/data are mapped at this point. When establishing this mapping, no
   125	   allocation can be done (since the system memory is not known yet), so
   126	   :c:var:`early_pg_dir` page table is statically allocated (using only one
   127	   table for each level).
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
