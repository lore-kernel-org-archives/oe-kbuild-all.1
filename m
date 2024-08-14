Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0795B1B32A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723644057; cv=none; b=Ln/bDBC2bKhewgAJE6f+S45vkHjmSuZlrJjtPIsa+9LxIgKoSmk9+OytE3Nn8/Iecm70FNrPq+cP6zOGFokFMh2J/je6y/RpqThM1wXwVjZVX49mDTwmqhzUPj3me2jyv5xcsjLhD+fvtI2tKWSPPON8DUpygoX7aKVZM6Cxtgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723644057; c=relaxed/simple;
	bh=dlFeX74aDDB+LwbUMMjMxEz0eFoJYS1jYkWc1fI9uHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o8tyB+O9vnh7k2bvSs9Bgvbf+zRWZQ3nYS7uSWaA4zQznjD5uO8T3XlfekGIVn8h8NiIydvODI8QRvenLO4rGJIT3LWkD+wYzH5T0+i1DuQ5SB+mnp4cIpJJyiKikdspLGsHTaCIOx5eGq+xz6UeDWZ/VUhTV7zbKR2rUjqh36Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fv1Pehd6; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fv1Pehd6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723644055; x=1755180055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dlFeX74aDDB+LwbUMMjMxEz0eFoJYS1jYkWc1fI9uHI=;
  b=Fv1Pehd6prd2mV89hO/ycR/SZWOxgCwxEN7ADhl4RUcjSTt09Ny+Dzhw
   qSt+i0TxNLLESCcy0R5nEj8qHxcuX2E567TpucHPS/uEeybIPKIN12NI0
   5gCw8gXzbIB6OBNWhMvnWQ73rnxAarRknifKb6474dy21YO5QV8970M1O
   U2srVaYKeamT5JYymhAH6nFkVw8hqoO8VkThhB2S6mfJROM73UepFY4gK
   XVPFxNZCE771ItE5mLfGzv9LV0XYlCFaOJ5idWI8AVmC5Baf6VCLaMNCH
   7Ldu8b5ghPrIFZEaSFsjNr/MyM08XdhAIoMCPuBr+GamDFujd5tzckyvP
   w==;
X-CSE-ConnectionGUID: w+CvMGZpSPOVaVkuLd/dag==
X-CSE-MsgGUID: 9RSnkghyTfi6V8k0Sran/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="22019252"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="22019252"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 07:00:53 -0700
X-CSE-ConnectionGUID: /ITLLFDMQzaIAGUHJ9s7jA==
X-CSE-MsgGUID: U8raj0CwTcuI7mx6abEO3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="59024254"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Aug 2024 07:00:52 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seEYT-0001iM-3C;
	Wed, 14 Aug 2024 14:00:50 +0000
Date: Wed, 14 Aug 2024 22:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chris Lew <quic_clew@quicinc.com>
Subject: [linux-next:master 4042/4667]
 drivers/rpmsg/qcom_glink_native.c:736:9: sparse: sparse: incorrect type in
 argument 5 (different base types)
Message-ID: <202408142123.xFCAwyNh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   320eb81df4f6c1a1814fd02ebb4ba41eb80a3c7e
commit: 34f79c11fb2f31ba05f13e42b936b3eae1783d40 [4042/4667] rpmsg: glink: Introduce packet tracepoints
config: arm64-randconfig-r113-20240814 (https://download.01.org/0day-ci/archive/20240814/202408142123.xFCAwyNh-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20240814/202408142123.xFCAwyNh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408142123.xFCAwyNh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/rpmsg/qcom_glink_native.c:414:9: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int version @@     got restricted __le16 [assigned] [usertype] param1 @@
   drivers/rpmsg/qcom_glink_native.c:414:9: sparse:     expected unsigned int version
   drivers/rpmsg/qcom_glink_native.c:414:9: sparse:     got restricted __le16 [assigned] [usertype] param1
   drivers/rpmsg/qcom_glink_native.c:414:9: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int features @@     got restricted __le32 [assigned] [usertype] param2 @@
   drivers/rpmsg/qcom_glink_native.c:414:9: sparse:     expected unsigned int features
   drivers/rpmsg/qcom_glink_native.c:414:9: sparse:     got restricted __le32 [assigned] [usertype] param2
>> drivers/rpmsg/qcom_glink_native.c:736:9: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned long [usertype] count @@     got restricted __le32 [assigned] [usertype] count @@
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     expected unsigned long [usertype] count
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     got restricted __le32 [assigned] [usertype] count
>> drivers/rpmsg/qcom_glink_native.c:736:9: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 [assigned] [usertype] size @@
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     expected unsigned long [usertype] size
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     got restricted __le32 [assigned] [usertype] size
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected unsigned int [usertype] liid @@     got restricted __le32 [assigned] [usertype] liid @@
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     expected unsigned int [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     got restricted __le32 [assigned] [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:930:9: sparse: sparse: restricted __le16 degrades to integer
>> drivers/rpmsg/qcom_glink_native.c:1063:9: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 @@
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse:     expected unsigned long [usertype] size
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse:     got restricted __le32
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected unsigned int [usertype] liid @@     got restricted __le32 @@
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse:     expected unsigned int [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse:     got restricted __le32
   drivers/rpmsg/qcom_glink_native.c: note: in included file (through include/linux/radix-tree.h, include/linux/idr.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +736 drivers/rpmsg/qcom_glink_native.c

   707	
   708	/**
   709	 * qcom_glink_advertise_intent - convert an rx intent cmd to wire format and
   710	 *			   transmit
   711	 * @glink:	The transport to transmit on.
   712	 * @channel:	The local channel
   713	 * @intent:	The intent to pass on to remote.
   714	 *
   715	 * Return: 0 on success or standard Linux error code.
   716	 */
   717	static int qcom_glink_advertise_intent(struct qcom_glink *glink,
   718					       struct glink_channel *channel,
   719					       struct glink_core_rx_intent *intent)
   720	{
   721		struct command {
   722			__le16 id;
   723			__le16 lcid;
   724			__le32 count;
   725			__le32 size;
   726			__le32 liid;
   727		} __packed;
   728		struct command cmd;
   729	
   730		cmd.id = cpu_to_le16(GLINK_CMD_INTENT);
   731		cmd.lcid = cpu_to_le16(channel->lcid);
   732		cmd.count = cpu_to_le32(1);
   733		cmd.size = cpu_to_le32(intent->size);
   734		cmd.liid = cpu_to_le32(intent->id);
   735	
 > 736		trace_qcom_glink_cmd_intent_tx(glink->label, channel->name,
   737					       channel->lcid, channel->rcid,
   738					       cmd.count, cmd.size, cmd.liid);
   739	
   740		qcom_glink_tx(glink, &cmd, sizeof(cmd), NULL, 0, true);
   741	
   742		return 0;
   743	}
   744	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
