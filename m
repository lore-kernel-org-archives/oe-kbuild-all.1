Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4A67F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 03:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692674832; x=1724210832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UfNzPUVk9JeaXlEM9GwP1xETBC5eNFq5OkjEJk1cz00=;
  b=PvIYZ4dtkBdGlhcrXHpcBCcbWsdAalVXPojsrN5b1EjFuoUxBeGbsl2v
   qZP7J2aEoZl/dut3wL+e7hgi/u9Z5andvLEyhGzE01pXTgeKpLxg1z7DP
   Wj3pU5FXQjWfISgI64C9nPbVJSkGVC4DnQk3F+A28Fgtqe2M/4eYkP84M
   wx5CP4dk6PL1780IlCNey4hsDi1j9+3Nx2d4I67kVqFHijqXO9gCu/1be
   Q2zxf8cSW6BrVyQMfY6nGzkisMdHlkGRiTfB8iCxM/xCoOVc/M6mEigE9
   lHjqpOtdjKe7tBJ0jZle32ppF32f8IJcocLoh7Jx2ENUamu9T+txDfwWp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="354094654"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="354094654"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 20:27:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="765592468"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="765592468"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 21 Aug 2023 20:27:10 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYI2U-0001IQ-1S;
	Tue, 22 Aug 2023 03:26:49 +0000
Date: Tue, 22 Aug 2023 11:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 28/30] net/ceph/osd_client.c:4501:67: error:
 'struct ceph_msg_data' has no member named 'pages'
Message-ID: <202308221117.z97443vy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   d98064c4bf02eba42e22917aecccfb339c094d26
commit: 44606536788ae21c995aa97a2b51489cf3a56a19 [28/30] ceph: Remove CEPH_MSG_DATA_PAGES and its helpers
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230822/202308221117.z97443vy-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221117.z97443vy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221117.z97443vy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254,
                    from include/linux/ceph/ceph_debug.h:7,
                    from net/ceph/osd_client.c:3:
   net/ceph/osd_client.c: In function 'handle_watch_notify':
   net/ceph/osd_client.c:4500:57: error: 'CEPH_MSG_DATA_PAGES' undeclared (first use in this function); did you mean 'CEPH_MSG_DATA_ITER'?
    4500 |                                                         CEPH_MSG_DATA_PAGES);
         |                                                         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   net/ceph/osd_client.c:4500:57: note: each undeclared identifier is reported only once for each function it appears in
    4500 |                                                         CEPH_MSG_DATA_PAGES);
         |                                                         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:123:32: note: in definition of macro 'WARN_ON'
     123 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   net/ceph/osd_client.c:4501:46: error: 'struct ceph_osd_linger_request' has no member named 'preply_pages'
    4501 |                                         *lreq->preply_pages = data->pages;
         |                                              ^~
>> net/ceph/osd_client.c:4501:67: error: 'struct ceph_msg_data' has no member named 'pages'
    4501 |                                         *lreq->preply_pages = data->pages;
         |                                                                   ^~
   net/ceph/osd_client.c:4502:46: error: 'struct ceph_osd_linger_request' has no member named 'preply_len'
    4502 |                                         *lreq->preply_len = data->length;
         |                                              ^~
>> net/ceph/osd_client.c:4502:65: error: 'struct ceph_msg_data' has no member named 'length'
    4502 |                                         *lreq->preply_len = data->length;
         |                                                                 ^~
>> net/ceph/osd_client.c:4503:45: error: 'struct ceph_msg_data' has no member named 'own_pages'
    4503 |                                         data->own_pages = false;
         |                                             ^~


vim +4501 net/ceph/osd_client.c

a02a946dfe9633 Ilya Dryomov  2017-06-19  4435  
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4436  /*
922dab6134178c Ilya Dryomov  2016-05-26  4437   * Process osd watch notifications
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4438   */
922dab6134178c Ilya Dryomov  2016-05-26  4439  static void handle_watch_notify(struct ceph_osd_client *osdc,
922dab6134178c Ilya Dryomov  2016-05-26  4440  				struct ceph_msg *msg)
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4441  {
922dab6134178c Ilya Dryomov  2016-05-26  4442  	void *p = msg->front.iov_base;
922dab6134178c Ilya Dryomov  2016-05-26  4443  	void *const end = p + msg->front.iov_len;
922dab6134178c Ilya Dryomov  2016-05-26  4444  	struct ceph_osd_linger_request *lreq;
922dab6134178c Ilya Dryomov  2016-05-26  4445  	struct linger_work *lwork;
922dab6134178c Ilya Dryomov  2016-05-26  4446  	u8 proto_ver, opcode;
922dab6134178c Ilya Dryomov  2016-05-26  4447  	u64 cookie, notify_id;
922dab6134178c Ilya Dryomov  2016-05-26  4448  	u64 notifier_id = 0;
1907920324f1f3 Ilya Dryomov  2016-04-28  4449  	s32 return_code = 0;
922dab6134178c Ilya Dryomov  2016-05-26  4450  	void *payload = NULL;
922dab6134178c Ilya Dryomov  2016-05-26  4451  	u32 payload_len = 0;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4452  
922dab6134178c Ilya Dryomov  2016-05-26  4453  	ceph_decode_8_safe(&p, end, proto_ver, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4454  	ceph_decode_8_safe(&p, end, opcode, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4455  	ceph_decode_64_safe(&p, end, cookie, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4456  	p += 8; /* skip ver */
922dab6134178c Ilya Dryomov  2016-05-26  4457  	ceph_decode_64_safe(&p, end, notify_id, bad);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4458  
922dab6134178c Ilya Dryomov  2016-05-26  4459  	if (proto_ver >= 1) {
922dab6134178c Ilya Dryomov  2016-05-26  4460  		ceph_decode_32_safe(&p, end, payload_len, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4461  		ceph_decode_need(&p, end, payload_len, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4462  		payload = p;
922dab6134178c Ilya Dryomov  2016-05-26  4463  		p += payload_len;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4464  	}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4465  
922dab6134178c Ilya Dryomov  2016-05-26  4466  	if (le16_to_cpu(msg->hdr.version) >= 2)
1907920324f1f3 Ilya Dryomov  2016-04-28  4467  		ceph_decode_32_safe(&p, end, return_code, bad);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4468  
922dab6134178c Ilya Dryomov  2016-05-26  4469  	if (le16_to_cpu(msg->hdr.version) >= 3)
922dab6134178c Ilya Dryomov  2016-05-26  4470  		ceph_decode_64_safe(&p, end, notifier_id, bad);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4471  
922dab6134178c Ilya Dryomov  2016-05-26  4472  	down_read(&osdc->lock);
922dab6134178c Ilya Dryomov  2016-05-26  4473  	lreq = lookup_linger_osdc(&osdc->linger_requests, cookie);
922dab6134178c Ilya Dryomov  2016-05-26  4474  	if (!lreq) {
922dab6134178c Ilya Dryomov  2016-05-26  4475  		dout("%s opcode %d cookie %llu dne\n", __func__, opcode,
922dab6134178c Ilya Dryomov  2016-05-26  4476  		     cookie);
922dab6134178c Ilya Dryomov  2016-05-26  4477  		goto out_unlock_osdc;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4478  	}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4479  
922dab6134178c Ilya Dryomov  2016-05-26  4480  	mutex_lock(&lreq->lock);
1907920324f1f3 Ilya Dryomov  2016-04-28  4481  	dout("%s opcode %d cookie %llu lreq %p is_watch %d\n", __func__,
1907920324f1f3 Ilya Dryomov  2016-04-28  4482  	     opcode, cookie, lreq, lreq->is_watch);
922dab6134178c Ilya Dryomov  2016-05-26  4483  	if (opcode == CEPH_WATCH_EVENT_DISCONNECT) {
922dab6134178c Ilya Dryomov  2016-05-26  4484  		if (!lreq->last_error) {
922dab6134178c Ilya Dryomov  2016-05-26  4485  			lreq->last_error = -ENOTCONN;
922dab6134178c Ilya Dryomov  2016-05-26  4486  			queue_watch_error(lreq);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4487  		}
1907920324f1f3 Ilya Dryomov  2016-04-28  4488  	} else if (!lreq->is_watch) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4489  		/* CEPH_WATCH_EVENT_NOTIFY_COMPLETE */
1907920324f1f3 Ilya Dryomov  2016-04-28  4490  		if (lreq->notify_id && lreq->notify_id != notify_id) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4491  			dout("lreq %p notify_id %llu != %llu, ignoring\n", lreq,
1907920324f1f3 Ilya Dryomov  2016-04-28  4492  			     lreq->notify_id, notify_id);
1907920324f1f3 Ilya Dryomov  2016-04-28  4493  		} else if (!completion_done(&lreq->notify_finish_wait)) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4494  			struct ceph_msg_data *data =
0d9c1ab3be4c01 Ilya Dryomov  2018-10-15  4495  			    msg->num_data_items ? &msg->data[0] : NULL;
1907920324f1f3 Ilya Dryomov  2016-04-28  4496  
1907920324f1f3 Ilya Dryomov  2016-04-28  4497  			if (data) {
99bc94d3d4c3bb David Howells 2023-08-03  4498  				if (lreq->reply) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4499  					WARN_ON(data->type !=
1907920324f1f3 Ilya Dryomov  2016-04-28  4500  							CEPH_MSG_DATA_PAGES);
1907920324f1f3 Ilya Dryomov  2016-04-28 @4501  					*lreq->preply_pages = data->pages;
1907920324f1f3 Ilya Dryomov  2016-04-28 @4502  					*lreq->preply_len = data->length;
e886274031200b Ilya Dryomov  2020-03-10 @4503  					data->own_pages = false;
1907920324f1f3 Ilya Dryomov  2016-04-28  4504  				}
1907920324f1f3 Ilya Dryomov  2016-04-28  4505  			}
1907920324f1f3 Ilya Dryomov  2016-04-28  4506  			lreq->notify_finish_error = return_code;
1907920324f1f3 Ilya Dryomov  2016-04-28  4507  			complete_all(&lreq->notify_finish_wait);
1907920324f1f3 Ilya Dryomov  2016-04-28  4508  		}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4509  	} else {
922dab6134178c Ilya Dryomov  2016-05-26  4510  		/* CEPH_WATCH_EVENT_NOTIFY */
922dab6134178c Ilya Dryomov  2016-05-26  4511  		lwork = lwork_alloc(lreq, do_watch_notify);
922dab6134178c Ilya Dryomov  2016-05-26  4512  		if (!lwork) {
922dab6134178c Ilya Dryomov  2016-05-26  4513  			pr_err("failed to allocate notify-lwork\n");
922dab6134178c Ilya Dryomov  2016-05-26  4514  			goto out_unlock_lreq;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4515  		}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4516  
922dab6134178c Ilya Dryomov  2016-05-26  4517  		lwork->notify.notify_id = notify_id;
922dab6134178c Ilya Dryomov  2016-05-26  4518  		lwork->notify.notifier_id = notifier_id;
922dab6134178c Ilya Dryomov  2016-05-26  4519  		lwork->notify.payload = payload;
922dab6134178c Ilya Dryomov  2016-05-26  4520  		lwork->notify.payload_len = payload_len;
922dab6134178c Ilya Dryomov  2016-05-26  4521  		lwork->notify.msg = ceph_msg_get(msg);
922dab6134178c Ilya Dryomov  2016-05-26  4522  		lwork_queue(lwork);
91883cd27c4e25 Ilya Dryomov  2014-09-11  4523  	}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4524  
922dab6134178c Ilya Dryomov  2016-05-26  4525  out_unlock_lreq:
922dab6134178c Ilya Dryomov  2016-05-26  4526  	mutex_unlock(&lreq->lock);
922dab6134178c Ilya Dryomov  2016-05-26  4527  out_unlock_osdc:
922dab6134178c Ilya Dryomov  2016-05-26  4528  	up_read(&osdc->lock);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4529  	return;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4530  
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4531  bad:
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4532  	pr_err("osdc handle_watch_notify corrupt msg\n");
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4533  }
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4534  

:::::: The code at line 4501 was first introduced by commit
:::::: 1907920324f1f3ebb6618344417c03a2863bba01 libceph: support for sending notifies

:::::: TO: Ilya Dryomov <idryomov@gmail.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
