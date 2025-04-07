Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5ED423C9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Apr 2025 03:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743995113; cv=none; b=ZrCk6gkXSz+OtvQisBzIDy5zQA+0HeO5BU3SwMD4QsCpuJ6pvsfqetm8st6ZE2VNogWuIzTADo6IjXc9NIwrLDvKZE41+7NubjJ1IPomNMxM+nvFbPQQ7JMHWd5VGc0aFQ1mBlB4kU3khRL2QG6/8tmxl2/z99b9oMgeu9wuNtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743995113; c=relaxed/simple;
	bh=KbXqFZzfTcX4nu5RN0pAfUzk5BAJnbxEYQ3gbYvVrgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MqIZZKKElwOVlyM7JfGcAKxDHuPiXMPu7S8JHOEGawUlfOpoi5uC+9dqRVfdDQ3AYUdYFLhA7B1YLW09SYNWMH4vU29+xP9bFaunxKictdkAXhN+kFafHj2KjK1LWeeELa9Rfz4y6JFcXZiKEE3SrnwgiCgto9G7rxk7Mf5i/W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NnG4Ixb3; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NnG4Ixb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743995112; x=1775531112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KbXqFZzfTcX4nu5RN0pAfUzk5BAJnbxEYQ3gbYvVrgk=;
  b=NnG4Ixb3UOAz0QGuWXPLukfkZmwqi/GOBaj0xdchb3qwnq8Gos8gqF0z
   jhml/QFDtSkQg2HN4Vij+xQ4EmJ1aDz3Ze0/0F5cz5FElKkrvwd0qgUV7
   5WV3vRphEAsm/Ukw0KkTS5fVFvf7BtO9+Y1uwkpV8KFaWHNubs6hC5wpa
   xUbVzo3HX6N7+4mRrMQ9en8/NpVt/FVbmjClWtW9PIjZM/ucPL2zpZRi8
   KPz8EemJKEVApbZqmfMIB9EH49PMihrCdFvXNzQFLZUfsFfxheRJqSFM0
   4tYQcWJMh2+PjsTEaJT1//visssPae2F8oydv7IQ2djoqGl76p+zvQe1e
   g==;
X-CSE-ConnectionGUID: RS17jU1BTNG+aFZt4j3ujA==
X-CSE-MsgGUID: DsPdS9CMSGGYaDViGlY3oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="45248265"
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="45248265"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2025 20:03:24 -0700
X-CSE-ConnectionGUID: 9+iOHGPFQHecgh55BSQQ2Q==
X-CSE-MsgGUID: QZWEidnlRGiFgl5hgD10+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,193,1739865600"; 
   d="scan'208";a="127656890"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 06 Apr 2025 20:03:22 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1clc-0002wF-26;
	Mon, 07 Apr 2025 03:03:20 +0000
Date: Mon, 7 Apr 2025 11:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v6] KEYS: Add a list for unreferenced keys
Message-ID: <202504071059.ondXrCEF-lkp@intel.com>
References: <20250407003622.22139-1-jarkko@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407003622.22139-1-jarkko@kernel.org>

Hi Jarkko,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.15-rc1]
[cannot apply to dhowells-fs/fscache-next dhowells-fs/keys-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/KEYS-Add-a-list-for-unreferenced-keys/20250407-083754
base:   linus/master
patch link:    https://lore.kernel.org/r/20250407003622.22139-1-jarkko%40kernel.org
patch subject: [PATCH v6] KEYS: Add a list for unreferenced keys
config: riscv-randconfig-001-20250407 (https://download.01.org/0day-ci/archive/20250407/202504071059.ondXrCEF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250407/202504071059.ondXrCEF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504071059.ondXrCEF-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: security/keys/key.o: in function `.LANCHOR0':
>> security/keys/key.c:26: multiple definition of `key_graveyard_lock'; security/keys/gc.o:security/keys/gc.c:14: first defined here
   riscv64-linux-ld: security/keys/key.o: in function `.LANCHOR0':
>> security/keys/key.c:25: multiple definition of `key_graveyard'; security/keys/gc.o:security/keys/gc.c:13: first defined here


vim +26 security/keys/key.c

    22	
    23	struct rb_root	key_user_tree; /* tree of quota records indexed by UID */
    24	DEFINE_SPINLOCK(key_user_lock);
  > 25	LIST_HEAD(key_graveyard);
  > 26	DEFINE_SPINLOCK(key_graveyard_lock);
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
