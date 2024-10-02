Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98FF1392
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 00:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727830544; cv=none; b=iYMYRGvRfRmB0A+aSSDOVbv+xvBBfp4WXTKdkI08cZoSFustr9fcvJK15RCISb5RxaTWeEjK8XnPdcxstaoRNzkhlAg8X7BlJmup/YTed8XbFyeWrqpvsZydN8vs5qCSGX8O+wrg3Jf1Jjq/028n9rJTtT3iDeCYVR/OCyIWuSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727830544; c=relaxed/simple;
	bh=gVpzBB0VH1nK/3Y9rM4HqI4StFHtGfIESg3gSaL5vNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RGCc6aGKVAVlJ74k6RSASmSmeT7lVaFpZyJbzY+2h+4ioU3bcaRW2K1+nPaEJE9RNc6NMusInpJSRxp7cF5B1U0KRcbSDPWD/bAvtYuWEcOXSkqi9894mtlhHkQoyR4kj53ewJHAMAMDJRETNlDdp0eSQjpx4OVcksImc4e+2h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBlRPWZ6; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBlRPWZ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727830543; x=1759366543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gVpzBB0VH1nK/3Y9rM4HqI4StFHtGfIESg3gSaL5vNw=;
  b=hBlRPWZ6yH037S+nLShsqkbMoZDV+E4iODjmL39AUftoyaomEIQOzdTV
   e0yA4iQp1XxfA+Zl8J4QRBi5IMm6jVxPvlhJKXKRblV1qc1dmQcSKPQQS
   cUHBrMdO4JqM2wAdNWcG0dzXdT/IGj1U/iMT6kY92PgiZUBXwLPEkMNOS
   Sn7jzG1/CihUpXPUkG5S2b049cDSQl60+LdZtAOn9Go2KFIHy2NDQAaK9
   0QmFfMFWayHDtkBDJpANLFroizGgXfL2c7HFPac2K3CMeeqJ2fFx/rw1q
   HrcJDXBWh93H84s0XliqrcqeWogZlNIVKRXGPia3OqyjtbViLiEMWvHdP
   g==;
X-CSE-ConnectionGUID: PxhbkKttTaywFK6ptn4SiQ==
X-CSE-MsgGUID: iHOogiuYStG5e1dQbuZ0wQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26865646"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="26865646"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 17:55:40 -0700
X-CSE-ConnectionGUID: aEwqvUWRSv2hidH+Bnj/7A==
X-CSE-MsgGUID: si4SyGkiRj+q0mgto/H8Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="73724934"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2024 17:55:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svneS-000RNN-1v;
	Wed, 02 Oct 2024 00:55:36 +0000
Date: Wed, 2 Oct 2024 08:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 106/1491]
 drivers/hid/i2c-hid/i2c-hid-core.c:522:72: error: 'struct hid_driver' has no
 member named 'reset'
Message-ID: <202410020833.AtUGRc5r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 05ecf1e093a2ac5fb4de3e229165c101fc1d2281 [106/1491] FROMLIST: HID: add HID device reset callback
config: arm-randconfig-004-20241002 (https://download.01.org/0day-ci/archive/20241002/202410020833.AtUGRc5r-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241002/202410020833.AtUGRc5r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410020833.AtUGRc5r-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hid/i2c-hid/i2c-hid-core.c: In function 'i2c_hid_get_input':
>> drivers/hid/i2c-hid/i2c-hid-core.c:522:72: error: 'struct hid_driver' has no member named 'reset'
     522 |                 if (ihid->hid && ihid->hid->driver && ihid->hid->driver->reset)
         |                                                                        ^~
   drivers/hid/i2c-hid/i2c-hid-core.c:523:42: error: 'struct hid_driver' has no member named 'reset'
     523 |                         ihid->hid->driver->reset(ihid->hid);
         |                                          ^~


vim +522 drivers/hid/i2c-hid/i2c-hid-core.c

   496	
   497	static void i2c_hid_get_input(struct i2c_hid *ihid)
   498	{
   499		u16 size = le16_to_cpu(ihid->hdesc.wMaxInputLength);
   500		u16 ret_size;
   501		int ret;
   502	
   503		if (size > ihid->bufsize)
   504			size = ihid->bufsize;
   505	
   506		ret = i2c_master_recv(ihid->client, ihid->inbuf, size);
   507		if (ret != size) {
   508			if (ret < 0)
   509				return;
   510	
   511			dev_err(&ihid->client->dev, "%s: got %d data instead of %d\n",
   512				__func__, ret, size);
   513			return;
   514		}
   515	
   516		/* Receiving buffer is properly aligned */
   517		ret_size = le16_to_cpup((__le16 *)ihid->inbuf);
   518		if (!ret_size) {
   519			/* host or device initiated RESET completed */
   520			if (test_and_clear_bit(I2C_HID_RESET_PENDING, &ihid->flags))
   521				wake_up(&ihid->wait);
 > 522			if (ihid->hid && ihid->hid->driver && ihid->hid->driver->reset)
   523				ihid->hid->driver->reset(ihid->hid);
   524			return;
   525		}
   526	
   527		if ((ihid->quirks & I2C_HID_QUIRK_BOGUS_IRQ) && ret_size == 0xffff) {
   528			dev_warn_once(&ihid->client->dev,
   529				      "%s: IRQ triggered but there's no data\n",
   530				      __func__);
   531			return;
   532		}
   533	
   534		if (ret_size > size || ret_size < sizeof(__le16)) {
   535			if (ihid->quirks & I2C_HID_QUIRK_BAD_INPUT_SIZE) {
   536				*(__le16 *)ihid->inbuf = cpu_to_le16(size);
   537				ret_size = size;
   538			} else {
   539				dev_err(&ihid->client->dev,
   540					"%s: incomplete report (%d/%d)\n",
   541					__func__, size, ret_size);
   542				return;
   543			}
   544		}
   545	
   546		i2c_hid_dbg(ihid, "input: %*ph\n", ret_size, ihid->inbuf);
   547	
   548		if (test_bit(I2C_HID_STARTED, &ihid->flags)) {
   549			if (ihid->hid->group != HID_GROUP_RMI)
   550				pm_wakeup_event(&ihid->client->dev, 0);
   551	
   552			hid_input_report(ihid->hid, HID_INPUT_REPORT,
   553					ihid->inbuf + sizeof(__le16),
   554					ret_size - sizeof(__le16), 1);
   555		}
   556	
   557		return;
   558	}
   559	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
