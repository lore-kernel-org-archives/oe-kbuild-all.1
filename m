Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C37E249E5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 03:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765683829; cv=none; b=sYLIii1lqU9ARj76q7Wq+JB7J9r3Q2K2NQVFM6x8sZec+39Z7HaoeeA10rab7xw979uuG74w8MIQZAHRRhWirKDVF4+hu03iLDQEBv84YC8EZwSTcFMIQZ3vdYztMbIKtjYCvEZuLAinpYQgsFqIJ1rzGEE2+cckZmhO2+Lcsp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765683829; c=relaxed/simple;
	bh=1cm8ek8nqp5TDRWSzTnByJKW3X1+NcNZLVyXDbWNSy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K/cJinnSikKuBG7eEFKZ4Pd6WeTtgoxA2w2Zyz2KesP+6pfxUv/I070tPT1zvyhShJrbkf9zkin4YRu0Oa6GrwBb4R5GptGeSCprair54Ls519kln3uJomq3KbPHZauciSBWAwoAR9gOY0Dj/t+nZ0ejX2i1xLqrPo82sG23+cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hoDqBbFV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hoDqBbFV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765683827; x=1797219827;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1cm8ek8nqp5TDRWSzTnByJKW3X1+NcNZLVyXDbWNSy4=;
  b=hoDqBbFVN3c/cq1aLKqbr3f83gK4aellyqFmKJPz8vAQBO+OagiHD+kH
   rhQ52uQSRjO6yOdcBoVLn78vNz8i2scsftaj/veVEgA2aMI6rlUwglpLd
   fMDNaK9qP4b89wasg0mKiCEZnRdk+6wVtR6iuJzw5bo/X/ncHjfKFb+Gc
   QfuE9cTL3mpXJJZBeF2xC+jU1xbHOsxgXTn+u420VjrHRgyTp8VB2PRWK
   V9KElY8o9JvnKQlbc3R43rNG/JKT7cl/Rrkin0fPYtCwigQSll3//HYNy
   KtoggeTu90avjHUlzY+6F3x4ZRUh4STCRNnaep6TNu5hmmt6AKjiAP8wz
   w==;
X-CSE-ConnectionGUID: QyErYHndTQelesr55ab+lg==
X-CSE-MsgGUID: kulQnGLAT/O7TzdvvKG+sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67668662"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67668662"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 19:43:47 -0800
X-CSE-ConnectionGUID: /ZMD7hr3SHWn7bNXtPlnNw==
X-CSE-MsgGUID: lqbIqr1aSGeL7qJS/0+kzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196717578"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Dec 2025 19:43:45 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUd1L-000000008XR-1qbH;
	Sun, 14 Dec 2025 03:43:43 +0000
Date: Sun, 14 Dec 2025 11:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1]
 drivers/rpmsg/qcom_glink_native.c:736:9: sparse: sparse: incorrect type in
 argument 5 (different base types)
Message-ID: <202512141108.lRQ35n0O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   17fd67ddf0cddeb7325b49d3ca2f7db7824dfccd
commit: 34f79c11fb2f31ba05f13e42b936b3eae1783d40 [0/1] rpmsg: glink: Introduce packet tracepoints
config: x86_64-randconfig-123-20251212 (https://download.01.org/0day-ci/archive/20251214/202512141108.lRQ35n0O-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512141108.lRQ35n0O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512141108.lRQ35n0O-lkp@intel.com/

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
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 [assigned] [usertype] size @@
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     expected unsigned long [usertype] size
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     got restricted __le32 [assigned] [usertype] size
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected unsigned int [usertype] liid @@     got restricted __le32 [assigned] [usertype] liid @@
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     expected unsigned int [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     got restricted __le32 [assigned] [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:930:9: sparse: sparse: restricted __le16 degrades to integer
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 @@
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse:     expected unsigned long [usertype] size
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse:     got restricted __le32
>> drivers/rpmsg/qcom_glink_native.c:1063:9: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected unsigned int [usertype] liid @@     got restricted __le32 @@
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse:     expected unsigned int [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse:     got restricted __le32

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
