Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793538832;
	b=AfrQMEsB6ltMrAmgam7Ei1rzpdfHOTYMdR3znBwrKfl8tbKBR0+xkJkZBHM4kdO+t/4o
	 K7jZlMQVMgfSi3LGH7WzEvyblbr4EyGM2dasJ1woQrOBfdgbkL+31Ilny5R2w1NcKHMj5
	 xTgZHMBzh13wWHZGIlEAn5yYRDKIT1udKaWloFBf43BoPJ20it9cFjZ+dcUMB8lzFZSUC
	 w4ustRacNiLkkak15HRK56WIKjCVtwSNkqgKhkiZt+K59B4D9YffJ2CytUPvU5mKuNwon
	 XkACymaYnps+WTGMkxCMISpFwNI023LnXRcZZIkXW4jJsxhEGo3bq3qTFHEM9T6KPqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793538832;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=U4XwdO3ioN7zF96MHtVPEifYah+1qgSKXNsOPERCZC0=;
	b=38wtmjyJwdLfO5JW2CPa4DzMa+TBfN5qHGQpnasT14T+qe3ZT1MIOX0YnG6eiCOF74Yu
	 wVBsJ9BefKAAAUyIWcLBKwWOP4itTeIOkIYlipOX2qcKf52romlgw+fG9lcysoqg5IO2U
	 njqvROOd4Jp5mvRLKlHe0iSJv7Y5ofxuqsRMaQfr8OOEcHnWt6kTLNhpa0AJyhZA7QUvQ
	 n6ht5sOLC3JUHOUdlACUVNq75gtxH3/TIosg8/0GjIu18N/85QUWSnxf2wDu/4suvSNLI
	 CLYTk+ZlAHPBeuBsuS5cZ9bDqsVgF7UXTYuIu8v6DEhQ6qdGYOeSRPu4V5C00aMTXew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gSj6FQkN;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552AD606A324
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Nov 2026 13:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 552AD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gSj6FQkN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793538830; x=1825074830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=K6kLYmti8wg3pfbET3mVpB4JgXQcMHSLvUUexHDGUlM=;
  b=gSj6FQkNsUOqUczpESyZD8xTKWNWIys+m4K7rYIIMmKzuaLAeaD0+xth
   kAH/hig6PENcp93aS6VQhkVL5dSIe8IEAKHb4zmQBdhn7P67SCbRa0YF1
   xU1V8NQ+42AyoZt4I54WA/m0o3HVWkQr0mCKCWlnuPPVwzn9xqG6Yyfuz
   jEMBEvkVmzgalANMFzeMcFhppChuJj9uuQ3mAooMwRb2aHvc9lAhvTfGx
   ujv/fHdBpG97nQ1fgOicbSEMReCLGu97ONaywB3sUNEWsjtpScqXwHIJa
   zg+SuzHCmxcAz2fB5fw7TAaJXlQx06ddh4ilL1HRWM4gg8EyvLcXFZdaf
   w==;
X-CSE-ConnectionGUID: WSqUSM8LRD2sErYi8nZ++g==
X-CSE-MsgGUID: hPHp/88DTWKdyuWgo4HHpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2265563"
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="2265563"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2026 05:13:49 -0800
X-CSE-ConnectionGUID: Nr0WMYIvSCG77sMZzHl8XQ==
X-CSE-MsgGUID: vierZFT9RjqYFa5vnVTf5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,190,1787036400"; 
   d="scan'208";a="5973720"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Nov 2026 05:13:43 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNVNT-00000000dmq-32VV;
	Sun, 01 Nov 2026 13:13:39 +0000
Date: Sun, 1 Nov 2026 21:13:03 +0800
From: kernel test robot <lkp@intel.com>
To: Cai Xinchen <caixinchen1@huawei.com>, mic@digikod.net,
	gnoack@google.com, paul@paul-moore.com, jmorris@namei.org,
	serge@hallyn.com, corbet@lwn.net, skhan@linuxfoundation.org,
	utilityemal77@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, ast@kernel.org, daniel@iogearbox.net,
	andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
	martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
	jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
	rdunlap@infradead.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, johan@kernel.org,
	dlemoal@kernel.org, hch@lst.de, axboe@kernel.dk,
	viro@zeniv.linux.org.uk, brauner@kernel.org
Subject: Re: [PATCH v3 -next 06/18] LSM: pass struct path and struct file to
 the inode xattr hooks
Message-ID: <202611012039.vHfMcyAk-lkp@intel.com>
References: <20261027121151.1887650-7-caixinchen1@huawei.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027121151.1887650-7-caixinchen1@huawei.com>

Hi Cai,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20261026]

url:    https://github.com/intel-lab-lkp/linux/commits/Cai-Xinchen/fs-pass-struct-path-to-notify_change/20261027-201134
base:   next-20261026
patch link:    https://lore.kernel.org/r/20261027121151.1887650-7-caixinchen1%40huawei.com
patch subject: [PATCH v3 -next 06/18] LSM: pass struct path and struct file to the inode xattr hooks
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20261101/202611012039.vHfMcyAk-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261101/202611012039.vHfMcyAk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611012039.vHfMcyAk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: security/commoncap.c:1063 function parameter 'idmap' not described in 'cap_inode_removexattr'
>> Warning: security/commoncap.c:1063 function parameter 'idmap' not described in 'cap_inode_removexattr'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
