Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C301946AA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 14:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727101170; cv=none; b=F/h543yFyYKsWHp2IyQZ8LSEihcngnfrSNNoX8htvY009KuwNY5o0X1V/T2DYwodsOYheV1ZJmPmdSxdBWHmK/nEeCxJhtABWQIn3IAukAKUgFlUxz28WEkne/31hUeNGcp/117lZt6vawQUMHaZy9JxMlRQf4eEY9HZ6P7JNRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727101170; c=relaxed/simple;
	bh=MJp1bPFthQYAG8Y+hEOvxPN2bhbOYJmrg3+mi147ISQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NyhzJiMNLa1XeyvIgn8ZG0+MyDtroF5PfvRU1dNnw9sdNZH12bBUGvrSCkTIqIbuJpREq8hTEcUTyauibMUgZZ9ySxOLevuQkgNZA65HgwGSfsGUuED0FnirP2T8UWzz2r96yMgrNVf8YhQRBrxK6DO0FcdRyc9c66wwjej4UjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjjKGusL; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjjKGusL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727101169; x=1758637169;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=MJp1bPFthQYAG8Y+hEOvxPN2bhbOYJmrg3+mi147ISQ=;
  b=VjjKGusLSxZuk0WV30TmmPM/qvXRGYDkQTuDzhWGW9ejATellsP5irV5
   gYgfjcNQRmAwXv38yRl+ZwkBKru9eBMj9o+O4w09ST01IQwuNj8clj/8f
   cSp/Jfahj7l3DsOkk3BOZTYK07+QUbZMUgjWEqjNoe29PtvPgJSOqetrX
   U0xwgH28dtUF2ZjhDJ3K8hxvAHldniyT31m0lY0D8vPTLd76r18BAd2x1
   W6GRJGqSp9tpxjgr/nQLkNozWv7qBmBg6zEdXX+/IZzzMdEefLmD3GL/6
   VhB8sUVugtyjy5B6R4RjVwPQWkSfIkU9yH66rUmkkWbQEmC+Iz5murq0q
   A==;
X-CSE-ConnectionGUID: XTwBDAQaQoy0s9KQBU2pjg==
X-CSE-MsgGUID: lZZpJvhRQVyW4sFjRS2dWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25918997"
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="25918997"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 07:19:29 -0700
X-CSE-ConnectionGUID: +yuhQcCXQqOzwWtd3NXmTg==
X-CSE-MsgGUID: +NnfFWmKSFSdI+SG7hAXQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,251,1719903600"; 
   d="scan'208";a="70669813"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2024 07:19:28 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssjuP-000HHE-1c;
	Mon, 23 Sep 2024 14:19:25 +0000
Date: Mon, 23 Sep 2024 22:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] usb: yurex: make waiting on yurex_write interruptible
Message-ID: <ZvF4t6MtUWOT6yY1@483fc80b4b15>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240923141649.148563-1-oneukum@suse.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH] usb: yurex: make waiting on yurex_write interruptible
Link: https://lore.kernel.org/stable/20240923141649.148563-1-oneukum%40suse.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



