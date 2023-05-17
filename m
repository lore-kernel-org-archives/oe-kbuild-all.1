Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D8318B16
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 May 2023 13:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684331967; x=1715867967;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gM9r/EaheKcU2Q8To2BO6C4meIqBvU1J3yytFb4RH+s=;
  b=GujvNxKe9BEuX2Lakjt2sHYz8NRHKyUZ45EMusMxDaQ8GgpeLVs/55SZ
   VNdZn1P8emIlwCOWb7BCtbB9u1cvSQCNaGnu6sCfvANi53Ykc0c4+SBv1
   YIelF1JzRp1+fs4Hx2FAKHuJ2nU8p3IB1gO/jSg4ZPEU8pyEr53AYNfwj
   29bH+xuVxs9mEoZAkh9BqAwr2mt0DlX3cZqUpaSB+EkimhC9fO4paokAU
   JTOidBckZlu08U2hpZ52R5jPjgeC8R3jqJ/X0ZWRsJlrFxTEBkGTo9i/c
   UEv4Pvm5RjgrdYO7PZffT6U4KStTdlvoAwDRtCGWoYV6u0FKxG9kPqRQN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="336317365"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="336317365"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2023 06:59:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10713"; a="695881953"
X-IronPort-AV: E=Sophos;i="5.99,282,1677571200"; 
   d="scan'208";a="695881953"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 17 May 2023 06:59:23 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pzHgY-0008x4-2z;
	Wed, 17 May 2023 13:59:22 +0000
Date: Wed, 17 May 2023 21:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux Kernel Actions <linux-actions@lists.infradead.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Cc: oe-kbuild-all@lists.linux.dev, Jan Kara <jack@suse.com>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Paul Eggert <eggert@twinsun.com>,
	Richard Fontana <rfontana@redhat.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH 2/2] fs: udf: udftime: Replace LGPL boilerplate with SPDX
 identifier
Message-ID: <202305172143.ClcGnDpO-lkp@intel.com>
References: <20230517083344.1090863-3-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517083344.1090863-3-bagasdotme@gmail.com>

Hi Bagas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 689cdaf84d7c00a1a77b25f545b4f3a48e3476d4]

url:    https://github.com/intel-lab-lkp/linux/commits/Bagas-Sanjaya/fs-udf-Replace-GPL-2-0-boilerplate-license-notice-with-SPDX-identifier/20230517-163856
base:   689cdaf84d7c00a1a77b25f545b4f3a48e3476d4
patch link:    https://lore.kernel.org/r/20230517083344.1090863-3-bagasdotme%40gmail.com
patch subject: [PATCH 2/2] fs: udf: udftime: Replace LGPL boilerplate with SPDX identifier
reproduce:
        scripts/spdxcheck.py

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305172143.ClcGnDpO-lkp@intel.com/

spdxcheck warnings: (new ones prefixed by >>)
>> fs/udf/udftime.c: 1:28 Invalid License ID: LGPL-2.0-or-later

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
