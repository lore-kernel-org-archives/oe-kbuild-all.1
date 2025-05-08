Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C422147F8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 23:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746745740; cv=none; b=qHT+TtfAcvwSfLrtDf1gV/IM2BZuZjVyQAA0LPLh35V2kRP1t6MPAqENESAClVZE7JYZXLafjbIxqcSikibbA01FrY7WQvb/5S0YpPzhJFPHHT0qiqYc0e4toB2QXkcVv0whoySNNP0NrfIFzya+wXP07p9JVAmWxJTWKj1Y9ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746745740; c=relaxed/simple;
	bh=x5D/nUqUTepORm08wkOUaenuC4Ib+uppGU/woUVnfBo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dIcaIna3ps7sCAb0ytQEpOkjX7lE3WFkjzcTiuW+6CRYrQJAe+rGJuPgcuCiA3H1UEJjGjPh7TPrN1mI/M0RlRa1tkXvxQp5Rawf8GA+u8j4pKrj/p9lANoHJe9IBYF/9aELoK3QCFeGU1GdY8ifiHgdUyVQdgsldYnGJvSczbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BQUrNSpb; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BQUrNSpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746745738; x=1778281738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x5D/nUqUTepORm08wkOUaenuC4Ib+uppGU/woUVnfBo=;
  b=BQUrNSpb/Klqgt/aAYaUF0N3NmV+dPTnqzBK01Q9UOhiVyerYzjb5TyN
   DjU5fczNDzK2QbS8C9lZ5n38tch9DmGEJjnIXGadoKT4vEdsEI2ayY4b0
   beFEi5mK4FLDNn/vezidWWZyFal42UG47/nU8WQBDLsjahfeo1UiqwemW
   CRX9m+prCEUx6m/3t56ubjvrQdYhV7V7IvKrMR5BMAkV/iwBQM0RjNST7
   VceoKqNS8v8VBh5EGGIcNtOeMUJOnoxw8h+AOgq6go8xtcdyLJxgQXNoT
   x6aTWgpi+hhhV6FB2Xc5j+yLwz4ABkQ7BW22bBA+rl7jKpyminRXdGQCY
   g==;
X-CSE-ConnectionGUID: TYsq92I1SxmGIANEhFPqzQ==
X-CSE-MsgGUID: 3lW0LEtZRk6MEWkhaTpr8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="59956354"
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="59956354"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 16:08:58 -0700
X-CSE-ConnectionGUID: JAuo5nf+QdqLLRKf9odO1g==
X-CSE-MsgGUID: cmy9LFhQQau7jI9Uuffrew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,273,1739865600"; 
   d="scan'208";a="136951428"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 May 2025 16:08:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDAMI-000BSP-0h;
	Thu, 08 May 2025 23:08:54 +0000
Date: Fri, 9 May 2025 07:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Hans Verkuil <hverkuil@xs4all.nl>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [linux-next:master 8164/9729] ERROR: modpost: "__udivdi3"
 [drivers/media/i2c/ov02c10.ko] undefined!
Message-ID: <202505090758.quGY0NdZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f48887a98b78880b7711aca311fbbbcaad6c4e3b
commit: 44f89010dae0eff6aabb9c14fb4b1001542498b4 [8164/9729] media: i2c: Add Omnivision OV02C10 sensor driver
config: parisc-randconfig-001-20250509 (https://download.01.org/0day-ci/archive/20250509/202505090758.quGY0NdZ-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250509/202505090758.quGY0NdZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505090758.quGY0NdZ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__udivdi3" [drivers/media/i2c/ov02c10.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/media/i2c/ov02c10.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
