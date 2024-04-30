Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCCA205E2E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Apr 2024 09:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714467647; cv=none; b=r7sI+W7ojrn00fZcslEFtT2nqIR+ULg5u967TQMpf0P8e1ImfnqhQETq7Kv7tyCylffuFFJH1S0c29GSscRt52gEM0GfRJk23v+a8VVom2/VSfcPQqLBo6bRTclZ/1kC/QTWnMb+0h/U4NOV7s0OVXDza/hDO+pxQXg4iLX83js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714467647; c=relaxed/simple;
	bh=3vRBqP8VpZM8cAKU/Oa9w0EQQKpZQz47V92hiizlLVg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SJnLf89b6KXMJi4x5NRMIRHauCdkWW/T3RnlHVQxVRyIhWW+fRJi+zIc+lNW0xxvR2RDe1PKls8MU4aHg9R+/BbJfv1kYZ0gqp1OFsZrhAPhbZ7+VSXlW0YhuHnOi0R5j2HyhzliTZY4lAKmrTld8ZqcCfa7jSz6pXlQyoHWTF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvXINk5S; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvXINk5S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714467646; x=1746003646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vRBqP8VpZM8cAKU/Oa9w0EQQKpZQz47V92hiizlLVg=;
  b=mvXINk5SV7GdOzAxxbz5hBKNhsdlpl5WnclvexyAMfxYxgCt0LNAJk9M
   2UHd2P9FiwpXtreCEkpG/vZoXZUquepd8DGFAB4T5DAs8aGaabl5KcLe2
   +7vbCenM7YBQT175evvZYCjWuJEnigyF3ovSL22UiFX+hv5/EHRf4BwtW
   bFCIHPZnN3tn11Jwt8HuwHIlrlXnAjaBpR26A/vGHYghOZI229WkeA3hK
   sZiIIeT8G5EJo3UXuzjvaatkihFx+KdR0DhUq6HtDGo9JbC6TFlLGwGs+
   WL1vt6HfH7LZk1A7rDABEgDogbf3epB5bg5Oo8k2yaZGjNA+TrFOPluu3
   A==;
X-CSE-ConnectionGUID: nClTwtoSQSul0fL+2XAu8w==
X-CSE-MsgGUID: vnnbUtXuR2mib4DWAncD6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10381706"
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="10381706"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2024 02:00:22 -0700
X-CSE-ConnectionGUID: xHPTeobGQtO+7l//4ZZL8w==
X-CSE-MsgGUID: JmZsYxAjSoe133oa9ev/mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,241,1708416000"; 
   d="scan'208";a="26331922"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Apr 2024 02:00:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1jLX-0007xn-2D;
	Tue, 30 Apr 2024 09:00:19 +0000
Date: Tue, 30 Apr 2024 16:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5948/11728]
 drivers/firmware/imx/sm-bbm.c:122:5: warning: no previous prototype for
 'scmi_imx_bbm_pwrkey_event'
Message-ID: <202404301640.dWDkfv9r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: bd493ca3f0194d0b2b41e5b3b03f35ce6f4d792d [5948/11728] LF-10711-7 firmware: imx: sm-bbm: support pwrkey
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240430/202404301640.dWDkfv9r-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404301640.dWDkfv9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404301640.dWDkfv9r-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/imx/sm-bbm.c:122:5: warning: no previous prototype for 'scmi_imx_bbm_pwrkey_event' [-Wmissing-prototypes]
     122 | int scmi_imx_bbm_pwrkey_event(struct scmi_imx_bbm *bbnsm)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/scmi_imx_bbm_pwrkey_event +122 drivers/firmware/imx/sm-bbm.c

   121	
 > 122	int scmi_imx_bbm_pwrkey_event(struct scmi_imx_bbm *bbnsm)
   123	{
   124		struct input_dev *input = bbnsm->input;
   125	
   126		schedule_delayed_work(&bbnsm->check_work, msecs_to_jiffies(DEBOUNCE_TIME));
   127	
   128		/*
   129		 * Directly report key event after resume to make no key press
   130		 * event is missed.
   131		 */
   132		if (bbnsm->suspended) {
   133			bbnsm->keystate = 1;
   134			input_event(input, EV_KEY, bbnsm->keycode, 1);
   135			input_sync(input);
   136		}
   137	
   138		return 0;
   139	}
   140	static void scmi_imx_bbm_pwrkey_act(void *pdata)
   141	{
   142		struct scmi_imx_bbm *bbnsm = pdata;
   143	
   144		cancel_delayed_work_sync(&bbnsm->check_work);
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
