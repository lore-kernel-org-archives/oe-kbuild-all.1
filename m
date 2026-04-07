Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2543750CB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775533767; cv=none; b=jym37EBo73ccxGX2Yvqv07ETm25fdQzcfNKpDwXiuzgk+eWjHhLOL227gtkn1wVlyy7q7sOAyUZzlN+ysdedUQP32YCBd2ZcM2WB3le3iAzoYUDIPVauYq1nJOfKr3YqV50XAGUOMDXwEdjclCX9uBfqIgkSBkwxDNiy7+0jvXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775533767; c=relaxed/simple;
	bh=Fpa2UYGcc2uHmgatVjtHEfanfZBsfLHt9h17nkADXW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mm77Ps5zNPTrTAYofq2Yn/eKuDwuS340LUPUBf/UBAQpHPutbeSdybwbpqCyDYm28sXvBNL7eAO7tFJztERwvyxoiZTG49cgi7Tecy1HjGskDOrYhczSLU2whQKJgkuRM2tjLtTNIH4B47+TWnNsl77My2ZhGPy5pV/N2TuFnp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M9QTQxWM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M9QTQxWM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775533766; x=1807069766;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fpa2UYGcc2uHmgatVjtHEfanfZBsfLHt9h17nkADXW0=;
  b=M9QTQxWMjCeNyKqUYlihegvrikcRCVCbwxPgT5WZcsvY6D+Y7SBTF61H
   FOnBxzFAuCuHymVqDIjxrE6krObgmt44ZH9/lKDcleFqWU5bcNGZAbnIB
   drfAUiQ9L8yRLhj/ayt7AHPkbCkNaKkP0KcgjKMP0bgrdA2/fxESiZwh2
   C0az15Ts2Cj3YxWYM+e7qVSkCxeQhezqryDtHHrJ5Lnood5FpifbDO1H2
   8TXOI8BN/fIiXvD6FwHkgqOVX7a7V1IrQ93guuYBfP6X6Cov12+znp5n/
   YEDxsN985QXIqXx5qL5NjWOlaEn0sSosia4Llz0qQqK7VsypPHPPXbILd
   w==;
X-CSE-ConnectionGUID: 6HJZI2EkRTW+Tg92U1NYpg==
X-CSE-MsgGUID: qkgHUcv9RqqCxHweoO1GBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76385876"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76385876"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:49:22 -0700
X-CSE-ConnectionGUID: EIbcbw2WT+yryRsjaWe5Zg==
X-CSE-MsgGUID: b+4zu8pYTAOny+RirgXHoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="251191886"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Apr 2026 20:49:20 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xRG-0000000001U-1Hw7;
	Tue, 07 Apr 2026 03:49:18 +0000
Date: Tue, 07 Apr 2026 11:49:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 David Gow <davidgow@google.com>
Subject: drivers/soc/qcom/smd-rpm.c:177:47: sparse: sparse: incorrect
 type in argument 2 (different address spaces)
Message-ID: <202604032358.ZK1EJ1Sq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d8a9a4b11a137909e306e50346148fc5c3b63f9d
commit: 031cdd3bc3f369553933c1b0f4cb18000162c8ff kunit: Enable PCI on UML without triggering WARN()
date:   7 months ago
config: um-randconfig-r122-20260403 (https://download.01.org/0day-ci/archive/20260403/202604032358.ZK1EJ1Sq-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e3cbd9984a78422c3799629eb6b5f7f7818c1a11)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604032358.ZK1EJ1Sq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604032358.ZK1EJ1Sq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/soc/qcom/smd-rpm.c:177:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned char const * @@
   drivers/soc/qcom/smd-rpm.c:177:47: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/soc/qcom/smd-rpm.c:177:47: sparse:     got unsigned char const *

vim +177 drivers/soc/qcom/smd-rpm.c

936f14cf4e6716 Bjorn Andersson 2015-07-27  146  
5052de8deff561 Bjorn Andersson 2017-03-27  147  static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
5052de8deff561 Bjorn Andersson 2017-03-27  148  				 void *data,
5052de8deff561 Bjorn Andersson 2017-03-27  149  				 int count,
5052de8deff561 Bjorn Andersson 2017-03-27  150  				 void *priv,
5052de8deff561 Bjorn Andersson 2017-03-27  151  				 u32 addr)
936f14cf4e6716 Bjorn Andersson 2015-07-27  152  {
936f14cf4e6716 Bjorn Andersson 2015-07-27  153  	const struct qcom_rpm_header *hdr = data;
30b7ea5eda0afb Stephen Boyd    2015-09-02  154  	size_t hdr_length = le32_to_cpu(hdr->length);
936f14cf4e6716 Bjorn Andersson 2015-07-27  155  	const struct qcom_rpm_message *msg;
5052de8deff561 Bjorn Andersson 2017-03-27  156  	struct qcom_smd_rpm *rpm = dev_get_drvdata(&rpdev->dev);
936f14cf4e6716 Bjorn Andersson 2015-07-27  157  	const u8 *buf = data + sizeof(struct qcom_rpm_header);
30b7ea5eda0afb Stephen Boyd    2015-09-02  158  	const u8 *end = buf + hdr_length;
936f14cf4e6716 Bjorn Andersson 2015-07-27  159  	char msgbuf[32];
936f14cf4e6716 Bjorn Andersson 2015-07-27  160  	int status = 0;
30b7ea5eda0afb Stephen Boyd    2015-09-02  161  	u32 len, msg_length;
936f14cf4e6716 Bjorn Andersson 2015-07-27  162  
30b7ea5eda0afb Stephen Boyd    2015-09-02  163  	if (le32_to_cpu(hdr->service_type) != RPM_SERVICE_TYPE_REQUEST ||
30b7ea5eda0afb Stephen Boyd    2015-09-02  164  	    hdr_length < sizeof(struct qcom_rpm_message)) {
b853cb9628bfbc Bjorn Andersson 2016-03-28  165  		dev_err(rpm->dev, "invalid request\n");
936f14cf4e6716 Bjorn Andersson 2015-07-27  166  		return 0;
936f14cf4e6716 Bjorn Andersson 2015-07-27  167  	}
936f14cf4e6716 Bjorn Andersson 2015-07-27  168  
936f14cf4e6716 Bjorn Andersson 2015-07-27  169  	while (buf < end) {
936f14cf4e6716 Bjorn Andersson 2015-07-27  170  		msg = (struct qcom_rpm_message *)buf;
30b7ea5eda0afb Stephen Boyd    2015-09-02  171  		msg_length = le32_to_cpu(msg->length);
30b7ea5eda0afb Stephen Boyd    2015-09-02  172  		switch (le32_to_cpu(msg->msg_type)) {
936f14cf4e6716 Bjorn Andersson 2015-07-27  173  		case RPM_MSG_TYPE_MSG_ID:
936f14cf4e6716 Bjorn Andersson 2015-07-27  174  			break;
936f14cf4e6716 Bjorn Andersson 2015-07-27  175  		case RPM_MSG_TYPE_ERR:
30b7ea5eda0afb Stephen Boyd    2015-09-02  176  			len = min_t(u32, ALIGN(msg_length, 4), sizeof(msgbuf));
936f14cf4e6716 Bjorn Andersson 2015-07-27 @177  			memcpy_fromio(msgbuf, msg->message, len);
936f14cf4e6716 Bjorn Andersson 2015-07-27  178  			msgbuf[len - 1] = 0;
936f14cf4e6716 Bjorn Andersson 2015-07-27  179  
936f14cf4e6716 Bjorn Andersson 2015-07-27  180  			if (!strcmp(msgbuf, "resource does not exist"))
936f14cf4e6716 Bjorn Andersson 2015-07-27  181  				status = -ENXIO;
936f14cf4e6716 Bjorn Andersson 2015-07-27  182  			else
936f14cf4e6716 Bjorn Andersson 2015-07-27  183  				status = -EINVAL;
936f14cf4e6716 Bjorn Andersson 2015-07-27  184  			break;
936f14cf4e6716 Bjorn Andersson 2015-07-27  185  		}
936f14cf4e6716 Bjorn Andersson 2015-07-27  186  
30b7ea5eda0afb Stephen Boyd    2015-09-02  187  		buf = PTR_ALIGN(buf + 2 * sizeof(u32) + msg_length, 4);
936f14cf4e6716 Bjorn Andersson 2015-07-27  188  	}
936f14cf4e6716 Bjorn Andersson 2015-07-27  189  
936f14cf4e6716 Bjorn Andersson 2015-07-27  190  	rpm->ack_status = status;
936f14cf4e6716 Bjorn Andersson 2015-07-27  191  	complete(&rpm->ack);
936f14cf4e6716 Bjorn Andersson 2015-07-27  192  	return 0;
936f14cf4e6716 Bjorn Andersson 2015-07-27  193  }
936f14cf4e6716 Bjorn Andersson 2015-07-27  194  

:::::: The code at line 177 was first introduced by commit
:::::: 936f14cf4e67168fcd37f10cebf5a475f490fb6e soc: qcom: Driver for the Qualcomm RPM over SMD

:::::: TO: Bjorn Andersson <bjorn.andersson@sonymobile.com>
:::::: CC: Andy Gross <agross@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
