Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8239F13D88E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723624363; cv=none; b=YRPevgv0KfTOELjq48lulGabyvvRVQS+wS9VrRjEDQfkKvV518fiZk/YpUrfJEVcJzeIzJE3MT3fP83El3oYBghreyoRyVBJ0MpZADKq0B3+yE9hEkxMQ3pkrpCsIfi/4RrMTlJwFI06hZeMKtHcsNAWvSYIAInTMkIGrtTzIwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723624363; c=relaxed/simple;
	bh=KKkC/xOq+4lxxdqZa0rhP3r3j+VnifhYlXc0MqhPdQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c1AdHZPb99mKvX+PY0Rwg/WL6m2U6XEvyDeXv+MmREpTPWlmXPjv4IY6KxA+Q4nl111ChZe7fTkX0FJdiqVdFpADAEXa7A95QiYrIaZJkeEKjBu2i0gdpG4SEaaPZ94vmsFquye4SpWF/OTs4neg421x3rXHNx8lm5eS7OT1D2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+LkpUJO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+LkpUJO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723624362; x=1755160362;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KKkC/xOq+4lxxdqZa0rhP3r3j+VnifhYlXc0MqhPdQk=;
  b=D+LkpUJOsncw6rXpt1v4M1Y1l05xA30IjR7901LR8XrpKXwAwePavwAD
   UsyFRGbdi5R/PDQc3jNPtnK+gbEi12fTlQ49Wm2aMwF8UkPUELLnhUGDr
   JFRQgbiU1HQwyCjR2gG9vKaegGfuox0Hgf89IvooMwLgoIHV8f1BnnVIP
   NiDXQZsaYJ9rqw1hRjagsOqQD9AmOuZrDkVzRWNjQe8b6OKrEJnkIgJhl
   icUW9ckza19LgjouqlRR4ER3+DnXTVxXG9zWyf6YEp7DFELPADMNkfjW7
   AnseSlB+UPwfO6NI2S8uugW3pEk05UWzYd1lpaQmnrsvaZ1u7dYf3MGCr
   g==;
X-CSE-ConnectionGUID: yvcwsg7aRpel8sUL6oVCnA==
X-CSE-MsgGUID: KmrGR045Rc6ShXwqc5BHlQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="32401339"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="32401339"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 01:32:39 -0700
X-CSE-ConnectionGUID: 7gN1wRmnRpWvm3yKF8bQgA==
X-CSE-MsgGUID: s/agcZ6ESlu+YkdUSfHSiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="58904729"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Aug 2024 01:32:37 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1se9Qp-0001Sx-15;
	Wed, 14 Aug 2024 08:32:35 +0000
Date: Wed, 14 Aug 2024 16:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chris Lew <quic_clew@quicinc.com>
Subject: [linux-next:master 4042/4667]
 drivers/rpmsg/qcom_glink_native.c:414:9: sparse: sparse: incorrect type in
 argument 2 (different base types)
Message-ID: <202408141659.CpPvwRMR-lkp@intel.com>
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
config: i386-randconfig-061-20240814 (https://download.01.org/0day-ci/archive/20240814/202408141659.CpPvwRMR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141659.CpPvwRMR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141659.CpPvwRMR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/rpmsg/qcom_glink_native.c:414:9: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int version @@     got restricted __le16 [assigned] [usertype] param1 @@
   drivers/rpmsg/qcom_glink_native.c:414:9: sparse:     expected unsigned int version
   drivers/rpmsg/qcom_glink_native.c:414:9: sparse:     got restricted __le16 [assigned] [usertype] param1
>> drivers/rpmsg/qcom_glink_native.c:414:9: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int features @@     got restricted __le32 [assigned] [usertype] param2 @@
   drivers/rpmsg/qcom_glink_native.c:414:9: sparse:     expected unsigned int features
   drivers/rpmsg/qcom_glink_native.c:414:9: sparse:     got restricted __le32 [assigned] [usertype] param2
>> drivers/rpmsg/qcom_glink_native.c:736:9: sparse: sparse: incorrect type in argument 5 (different base types) @@     expected unsigned int [usertype] count @@     got restricted __le32 [assigned] [usertype] count @@
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     expected unsigned int [usertype] count
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     got restricted __le32 [assigned] [usertype] count
>> drivers/rpmsg/qcom_glink_native.c:736:9: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 [assigned] [usertype] size @@
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     expected unsigned int [usertype] size
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     got restricted __le32 [assigned] [usertype] size
>> drivers/rpmsg/qcom_glink_native.c:736:9: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected unsigned int [usertype] liid @@     got restricted __le32 [assigned] [usertype] liid @@
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     expected unsigned int [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:736:9: sparse:     got restricted __le32 [assigned] [usertype] liid
>> drivers/rpmsg/qcom_glink_native.c:930:9: sparse: sparse: restricted __le16 degrades to integer
>> drivers/rpmsg/qcom_glink_native.c:1063:9: sparse: sparse: incorrect type in argument 6 (different base types) @@     expected unsigned int [usertype] size @@     got restricted __le32 @@
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse:     expected unsigned int [usertype] size
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse:     got restricted __le32
>> drivers/rpmsg/qcom_glink_native.c:1063:9: sparse: sparse: incorrect type in argument 7 (different base types) @@     expected unsigned int [usertype] liid @@     got restricted __le32 @@
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse:     expected unsigned int [usertype] liid
   drivers/rpmsg/qcom_glink_native.c:1063:9: sparse:     got restricted __le32

vim +414 drivers/rpmsg/qcom_glink_native.c

   405	
   406	static void qcom_glink_send_version_ack(struct qcom_glink *glink)
   407	{
   408		struct glink_msg msg;
   409	
   410		msg.cmd = cpu_to_le16(GLINK_CMD_VERSION_ACK);
   411		msg.param1 = cpu_to_le16(GLINK_VERSION_1);
   412		msg.param2 = cpu_to_le32(glink->features);
   413	
 > 414		trace_qcom_glink_cmd_version_ack_tx(glink->label, msg.param1, msg.param2);
   415	
   416		qcom_glink_tx(glink, &msg, sizeof(msg), NULL, 0, true);
   417	}
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
