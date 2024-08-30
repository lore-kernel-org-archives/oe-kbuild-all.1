Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98681AF4DA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 13:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725025994; cv=none; b=atbqNDAk2CSBRGR+slyzdZvZ4XCC7fixh4eq1m/j1Be0G6ZdHMlmgC+zC4aTBsn2YWU0ZbFa1EV1lMsVegx3ABb0+20Msz6rJoe8tNo//PfHHrN0qKcVsNV2LoWeTBl3a98ygRgoLRZpRuY8sdKqeLBXs8ew2BBm8Se9XNwyQt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725025994; c=relaxed/simple;
	bh=1oUaswg+R8iG+WjLxCH8ZGJv1FtLEoU3wQI7+4G6kcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJKpWAeBhcoc5NAbD1Zm2yhaPLx3SUiECIBPu94E6L52egWu2tZCrDD2IR9CrS3P0O514nMf2lerUFPtkl99Bgiszt+RB2UaXEjYmxTLjakBVsgjTqC0LcyWQZf4CIEKrY0gqACRPzrsIX8dUVEfcldOPFoWoSuHU63RuDoM6Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoUhychW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoUhychW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725025994; x=1756561994;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1oUaswg+R8iG+WjLxCH8ZGJv1FtLEoU3wQI7+4G6kcM=;
  b=hoUhychWMkxbUbFAZxBZ0ryeZ+MVGrzBT5eN7n72dtF+ZHgt/dsoyN/6
   yElToieDEJwM3m56oQmGr7hCyST0zJD0/2hTDIo8BjHx9b2O5m0x/vog/
   onVTld7rvq1akKmvj/SDW7pUQOPt7Wvo2Cmwv8MtB0ECq6EXQZGULwGo3
   0RbPZ7aJmTes6F+KRnulWf+QWwJvgCDsEkC2EZ/fuJ8zZv5hnJNzpl+G7
   usKjiJW3Tb9fo/2GN+PFVM77X5H83dSXlRDQ3uRjIUQ5txSiOtpJdTJRq
   wCL/Uaze5x6Tcp4VV/kgU1/Iq+Mqd4YjuT0EacW9kZdULd07bsUX2MrKO
   w==;
X-CSE-ConnectionGUID: F5/K6KgrQcW00Mp/rQkTmA==
X-CSE-MsgGUID: 9HF3aE3yS5y9SvKTJa1tGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34238019"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="34238019"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 06:53:13 -0700
X-CSE-ConnectionGUID: 1zl4l9iHR3WPXK21eHv87g==
X-CSE-MsgGUID: Regz6k+dQlyUnw94RonRTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="94641000"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Aug 2024 06:53:12 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk23o-0001Vy-2j;
	Fri, 30 Aug 2024 13:53:08 +0000
Date: Fri, 30 Aug 2024 21:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/2] Bluetooth: MGMT: Ignore keys being loaded with
 invalid type
Message-ID: <202408302106.kBcgzIZ5-lkp@intel.com>
References: <20240828181051.876598-2-luiz.dentz@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828181051.876598-2-luiz.dentz@gmail.com>

Hi Luiz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bluetooth-next/master]
[also build test WARNING on bluetooth/master linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luiz-Augusto-von-Dentz/Bluetooth-MGMT-Ignore-keys-being-loaded-with-invalid-type/20240829-021403
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20240828181051.876598-2-luiz.dentz%40gmail.com
patch subject: [PATCH v2 2/2] Bluetooth: MGMT: Ignore keys being loaded with invalid type
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240830/202408302106.kBcgzIZ5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408302106.kBcgzIZ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408302106.kBcgzIZ5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from net/bluetooth/mgmt.c:30:
   net/bluetooth/mgmt.c: In function 'load_link_keys':
>> include/net/bluetooth/bluetooth.h:276:17: warning: format '%u' expects argument of type 'unsigned int', but argument 3 has type '__u8 *' {aka 'unsigned char *'} [-Wformat=]
     276 |         BT_WARN("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
         |                 ^~~~~~
   include/net/bluetooth/bluetooth.h:262:41: note: in definition of macro 'BT_WARN'
     262 | #define BT_WARN(fmt, ...)       bt_warn(fmt "\n", ##__VA_ARGS__)
         |                                         ^~~
   net/bluetooth/mgmt.c:2858:25: note: in expansion of macro 'bt_dev_warn'
    2858 |                         bt_dev_warn(hdev,
         |                         ^~~~~~~~~~~
>> include/net/bluetooth/bluetooth.h:276:17: warning: format '%p' expects a matching 'void *' argument [-Wformat=]
     276 |         BT_WARN("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
         |                 ^~~~~~
   include/net/bluetooth/bluetooth.h:262:41: note: in definition of macro 'BT_WARN'
     262 | #define BT_WARN(fmt, ...)       bt_warn(fmt "\n", ##__VA_ARGS__)
         |                                         ^~~
   net/bluetooth/mgmt.c:2858:25: note: in expansion of macro 'bt_dev_warn'
    2858 |                         bt_dev_warn(hdev,
         |                         ^~~~~~~~~~~


vim +276 include/net/bluetooth/bluetooth.h

9b392e0e0b6d02 Luiz Augusto von Dentz 2022-03-03  272  
6f558b70fb39fc Loic Poulain           2015-08-30  273  #define bt_dev_info(hdev, fmt, ...)				\
9b392e0e0b6d02 Luiz Augusto von Dentz 2022-03-03  274  	BT_INFO("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
594b31ea7dc610 Frederic Danis         2015-09-23  275  #define bt_dev_warn(hdev, fmt, ...)				\
9b392e0e0b6d02 Luiz Augusto von Dentz 2022-03-03 @276  	BT_WARN("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
6f558b70fb39fc Loic Poulain           2015-08-30  277  #define bt_dev_err(hdev, fmt, ...)				\
9b392e0e0b6d02 Luiz Augusto von Dentz 2022-03-03  278  	BT_ERR("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
6f558b70fb39fc Loic Poulain           2015-08-30  279  #define bt_dev_dbg(hdev, fmt, ...)				\
9b392e0e0b6d02 Luiz Augusto von Dentz 2022-03-03  280  	BT_DBG("%s: " fmt, bt_dev_name(hdev), ##__VA_ARGS__)
6f558b70fb39fc Loic Poulain           2015-08-30  281  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
