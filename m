Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8112256C8B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 14:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776435778; cv=none; b=s2YFfNbOxcF8j37BI4K1cTePrZBvW4FtAxfl7vue99iusg0jzt01x8J+K4AcRAUxkrKztatcT0lGJpyF8YTjPBzUPC294uyzUcwje1kRRp6hDd/TPJeRuFfq8Xu+rPNz36cojef4w8+8PsuxQti4wAtysdm/eHAYYlHbiDwGxFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776435778; c=relaxed/simple;
	bh=JQYkjLDSKJXOVqOyOYo0b7kT/NLUCXD0KHJPPxniWMI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Jar6Gyyr9O2Q7AhmO4T9kJdkKadmmzDOBfGq+2Xw1liJsehSCbtllKGRmr8uL5gOohNzsXaNGOSA3Sk5BYg/6nelt5CCsUAnzkPYZq/eNf/keXiWbBUOUgl+OugiE6E1xJXuyuIHgR3scz8fqdhb1ryegZwM+jndQDbI9cqqIag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bCWdryGr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bCWdryGr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776435776; x=1807971776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JQYkjLDSKJXOVqOyOYo0b7kT/NLUCXD0KHJPPxniWMI=;
  b=bCWdryGrd4yQUwY539Bt0Nnrc1r1Qkl1w0Q1/tGSZNxHfqK1phdbBUP7
   zMOQ/I3UZglSn2tMgxAp0tHg7xWV0s2NA27Ul1NRFJFOs+rLpetqWMeGI
   7OzN4JrWx4iSo4Rcn7Ws6trw3T3UQO0zo/ci01cGrgUrRku9QXufoKhT4
   gVclCTPM8kM7St/EiNoF7m5eC8WaxLQthqTAM77/3wbzGCiy/udJ9pI1G
   0WEQN1Xths6Z3dLWP/0379/oksNXPJb4YkfrwKxWLo+cMu/g5dE0YNl3N
   q6pXiSbUm/IX6b7LjRelb6hGgbTG2zhc/j4UMCOw9BlYIrInNf4UiqBCD
   Q==;
X-CSE-ConnectionGUID: n2PqzVPzRh+m4A8iNrSQow==
X-CSE-MsgGUID: e3+EH3wPSJqggNh6EG/c6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77526201"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="77526201"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 07:22:55 -0700
X-CSE-ConnectionGUID: RdVLKDc9QcCVx3zjVr2SnQ==
X-CSE-MsgGUID: 7IKQPa6FSPGdhna+9uHeVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="232802468"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Apr 2026 07:22:55 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDk5s-000000000S4-29cw;
	Fri, 17 Apr 2026 14:22:52 +0000
Date: Fri, 17 Apr 2026 22:22:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:jump-batch-core 38/93] lib/dynamic_debug.c:76:1:
 sparse: sparse: symbol '__pcpu_scope_ddebug_call_count' was not declared.
 Should it be static?
Message-ID: <202604172217.21b1Cp47-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/jimc/linux.git jump-batch-core
head:   0503dd993f11b134b9455aa281be44638c124fa2
commit: 578ba3e8f66ce12750392041717587f3cd9efc66 [38/93] dyndbg: add +c flag to demonstrate advantage of classmaps for DRM
config: loongarch-randconfig-r131-20260417 (https://download.01.org/0day-ci/archive/20260417/202604172217.21b1Cp47-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604172217.21b1Cp47-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604172217.21b1Cp47-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/dynamic_debug.c:76:1: sparse: sparse: symbol '__pcpu_scope_ddebug_call_count' was not declared. Should it be static?

vim +/__pcpu_scope_ddebug_call_count +76 lib/dynamic_debug.c

    75	
  > 76	DEFINE_PER_CPU(unsigned long, ddebug_call_count);
    77	EXPORT_PER_CPU_SYMBOL(ddebug_call_count);
    78	void ddebug_increment_call_count(void)
    79	{
    80		this_cpu_inc(ddebug_call_count);
    81	}
    82	EXPORT_SYMBOL(ddebug_increment_call_count);
    83	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
