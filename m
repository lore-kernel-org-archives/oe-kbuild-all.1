Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E227D386
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 01:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693013584; x=1724549584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8p2WPlfRe8dkhSowoYjCa+XHM8O61OcrEatJ/uyU/Fw=;
  b=g9j6thX1k6jYbMVqeewAkZGJQ7phTo+jpBy3zkJpHP5dGXjMQriO7HQ6
   VxW8ggaBHb2zts/sX8oWKPxl1LgUmBn0SmOnYYNOMLw0Vh0K8G3ngMubo
   Ms4dN6uwTubZpHSoEI5JVgbkTogJengnEcjauexR+uMhJnlGCtZUEh4j0
   wZwaunSExp3vBjkA5fkoYmpKHrFnhBmVEtDksamAAhopyAFjYOME/1W4G
   i90AbcPqZNiC3fDx57CJIm2j2f7o5ad+FkGio8gh53DU6fkEZ6pfOEBSz
   5I7IIeQLWrbDUbqiSsyOGRan6eb4+Gh2fnWZWVvXaDCA9AeOhhq0XYOm4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="405831041"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="405831041"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 18:33:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="767095324"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="767095324"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2023 18:33:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZiAd-0004Dr-1B;
	Sat, 26 Aug 2023 01:32:59 +0000
Date: Sat, 26 Aug 2023 09:32:07 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 167/167]
 drivers/s390/crypto/zcrypt_msgtype6.c:1160:9: error: 'msg' undeclared
Message-ID: <202308260941.ew8aPMhp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   b0877f85780f9385c158a9ccc1c8cabd63ababf8
commit: b0877f85780f9385c158a9ccc1c8cabd63ababf8 [167/167] s390/zcrypt: fix reply buffer calculations for CCA replies
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230826/202308260941.ew8aPMhp-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260941.ew8aPMhp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260941.ew8aPMhp-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/s390/crypto/zcrypt_msgtype6.c: In function 'zcrypt_msgtype6_send_cprb':
>> drivers/s390/crypto/zcrypt_msgtype6.c:1160:9: error: 'msg' undeclared (first use in this function)
    1160 |         msg->hdr.fromcardlen1 = min(msg->hdr.fromcardlen1, max_payload_size);
         |         ^~~
   drivers/s390/crypto/zcrypt_msgtype6.c:1160:9: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/kernel.h:16,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from drivers/s390/crypto/zcrypt_msgtype6.c:16:
   include/linux/minmax.h:36:9: error: first argument to '__builtin_choose_expr' not a constant
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
      45 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   drivers/s390/crypto/zcrypt_msgtype6.c:1160:33: note: in expansion of macro 'min'
    1160 |         msg->hdr.fromcardlen1 = min(msg->hdr.fromcardlen1, max_payload_size);
         |                                 ^~~
   include/linux/minmax.h:36:9: error: first argument to '__builtin_choose_expr' not a constant
      36 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:45:25: note: in expansion of macro '__careful_cmp'
      45 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   drivers/s390/crypto/zcrypt_msgtype6.c:1161:33: note: in expansion of macro 'min'
    1161 |         msg->hdr.fromcardlen2 = min(msg->hdr.fromcardlen2, max_payload_size);
         |                                 ^~~
   drivers/s390/crypto/zcrypt_msgtype6.c:1191:46: error: 'AP_MSG_FLAG_ADMIN' undeclared (first use in this function); did you mean 'AP_MSG_FLAG_SPECIAL'?
    1191 |         if (rc == -EAGAIN && ap_msg->flags & AP_MSG_FLAG_ADMIN)
         |                                              ^~~~~~~~~~~~~~~~~
         |                                              AP_MSG_FLAG_SPECIAL
   drivers/s390/crypto/zcrypt_msgtype6.c: In function 'zcrypt_msgtype6_send_ep11_cprb':
   drivers/s390/crypto/zcrypt_msgtype6.c:1300:46: error: 'AP_MSG_FLAG_ADMIN' undeclared (first use in this function); did you mean 'AP_MSG_FLAG_SPECIAL'?
    1300 |         if (rc == -EAGAIN && ap_msg->flags & AP_MSG_FLAG_ADMIN)
         |                                              ^~~~~~~~~~~~~~~~~
         |                                              AP_MSG_FLAG_SPECIAL


vim +/msg +1160 drivers/s390/crypto/zcrypt_msgtype6.c

  1140	
  1141	/*
  1142	 * The request distributor calls this function if it picked the CEXxC
  1143	 * device to handle a send_cprb request.
  1144	 * @zq: pointer to zcrypt_queue structure that identifies the
  1145	 *	CEXxC device to the request distributor
  1146	 * @xcRB: pointer to the send_cprb request buffer
  1147	 */
  1148	static long zcrypt_msgtype6_send_cprb(bool userspace, struct zcrypt_queue *zq,
  1149					      struct ica_xcRB *xcRB,
  1150					      struct ap_message *ap_msg)
  1151	{
  1152		struct response_type *rtype = ap_msg->private;
  1153		unsigned int max_payload_size;
  1154		int rc, delta;
  1155	
  1156		/* calculate maximum payload for this card and msg type */
  1157		max_payload_size = zq->reply.bufsize - sizeof(struct type86_fmt2_msg);
  1158	
  1159		/* limit each of the two from fields to the maximum payload size */
> 1160		msg->hdr.fromcardlen1 = min(msg->hdr.fromcardlen1, max_payload_size);
  1161		msg->hdr.fromcardlen2 = min(msg->hdr.fromcardlen2, max_payload_size);
  1162	
  1163		/* calculate delta if the sum of both exceeds max payload size */
  1164		delta = msg->hdr.fromcardlen1 + msg->hdr.fromcardlen2
  1165			- max_payload_size;
  1166		if (delta > 0) {
  1167			/*
  1168			 * Sum exceeds maximum payload size, prune fromcardlen1
  1169			 * (always trust fromcardlen2)
  1170			 */
  1171			if (delta > msg->hdr.fromcardlen1) {
  1172				rc = -EINVAL;
  1173				goto out;
  1174			}
  1175			msg->hdr.fromcardlen1 -= delta;
  1176		}
  1177	
  1178		init_completion(&rtype->work);
  1179		rc = ap_queue_message(zq->queue, ap_msg);
  1180		if (rc)
  1181			goto out;
  1182		rc = wait_for_completion_interruptible(&rtype->work);
  1183		if (rc == 0) {
  1184			rc = ap_msg->rc;
  1185			if (rc == 0)
  1186				rc = convert_response_xcrb(userspace, zq, ap_msg, xcRB);
  1187		} else
  1188			/* Signal pending. */
  1189			ap_cancel_message(zq->queue, ap_msg);
  1190	
  1191		if (rc == -EAGAIN && ap_msg->flags & AP_MSG_FLAG_ADMIN)
  1192			rc = -EIO; /* do not retry administrative requests */
  1193	
  1194	out:
  1195		return rc;
  1196	}
  1197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
