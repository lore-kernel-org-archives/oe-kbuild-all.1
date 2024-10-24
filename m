Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5151D049D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 11:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729771136; cv=none; b=inkQ+QXeXd9nq77l+ADauTNJAv2Szr9RnulNBe5ikDWvKIW23VeYxSjXgVJxCxkBB7TImkwvmOdP5QzjUKbC6AGu/IGJCREA2uGESa6uEaJxikKrTJ9XsPe50cGUGH0GM/c1Klpse1WJl/O6AKZvVIHIxX+RyC2pMxQuCtBGIa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729771136; c=relaxed/simple;
	bh=Xh5asUwDDKxhkz4/FkDIIn8mUbNfojR+MrR+KtHqf1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eWV8o6Uxf41TZFuta6+Rqff4tJ6Lnzcv07skHUKroU5fvjzbDat/nFRXlHg5SKqVUsFNYUW2KjdPe0hAX7dNEM0slUST8EOV3INh7WIc5+sNZnc9ytfUQpJSEavXqAyHo9MDl8JmBOh1jdS2EidJFuQPgIy3Zlt1TG2GhwMxmH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OH82WVmq; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OH82WVmq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729771134; x=1761307134;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xh5asUwDDKxhkz4/FkDIIn8mUbNfojR+MrR+KtHqf1w=;
  b=OH82WVmqg/5uqj6jqs4Fy0xFgsnc56ru3tawM1KKR5a7LWdDhGgT8u5C
   /xyMczuLRisAWOYmx74APyYgDxvAH3bkC63tkOdZhlX/tJD4SDVRNZ1Jx
   Ad5vSICn7nU+8r5HnZe9p5r5w7JsPtekpP1N8MVgIIzh19RqBTPndDm2A
   uLs3bpw7paDVaFtedQUvhptYTt4yKgXsLbFQLTZ/eOVBtXlDu2hetuL9W
   aNzXV4ifYUIqbWwiKdmtti6CfRrYz21ocMlEap+M7ntL1VHvT6HM81Mxp
   gnlUdBJR7EBlbf2zGs2zM7tRE+1xC+GI8Gdf+MaDC8fAj+54N3Ikg8Nf7
   Q==;
X-CSE-ConnectionGUID: lvMQfvAySt2fwX2pwvTM3A==
X-CSE-MsgGUID: KRTV5RoBR2WR5wrZYk2xvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40513335"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40513335"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 04:58:51 -0700
X-CSE-ConnectionGUID: fJAMkhj/SsmZ4DUFGSOtTQ==
X-CSE-MsgGUID: 3izc4216RxStADb94iwtRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80663005"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Oct 2024 04:58:50 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3wUK-000WMM-0c;
	Thu, 24 Oct 2024 11:58:48 +0000
Date: Thu, 24 Oct 2024 19:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: oe-kbuild-all@lists.linux.dev, Paul Moore <paul@paul-moore.com>
Subject: [linux-next:master 6523/6766] undefined reference to `init_net'
Message-ID: <202410241927.ApAyZaSQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
commit: 6d2eccb70d100b9f5405714a469d39fd9195af21 [6523/6766] lsm: Add audit_log_lsm_data() helper
config: x86_64-buildonly-randconfig-004-20241024 (https://download.01.org/0day-ci/archive/20241024/202410241927.ApAyZaSQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241927.ApAyZaSQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241927.ApAyZaSQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `audit_log_lsm_data':
>> (.text+0x7dd679): undefined reference to `init_net'
>> ld: (.text+0x7dd67e): undefined reference to `dev_get_by_index'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
