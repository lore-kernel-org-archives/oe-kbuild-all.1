Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E978110B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 02:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692670740; x=1724206740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RNjSFDZzKN7Jtu1TCjcP0aZppfCUu6Pb5hn+mJBNbBU=;
  b=QnsEaM5P/Ur16q1QSG9nnd7JhMJ9o4TM3rdLC78QZyMe3d91AZ3C9sme
   Hpjo3cu5JusaCknLpufLbv43UbJIVsWQfyhHz6apjlUHdqkUVdjTLt9KP
   KtGQB0FNI/xvginC356Y7YbQvomuWUv251Op4YjUc7NilkAG5LRzGITke
   ycd4+xHVIqya3TH+Bm+d/YM/1OpOvgTlQBe+iUU/ebGk9XK5yNQhXmA09
   W9o+lnnyXgtlteuArhQYntPjpSBJg6m1OBkEGHn9zVTDvk3bAEwVdvFTj
   KjOkUqB9PSz8ASUj3XOo+Fmq5HtlWFt4GmwQZ50B2WFUQpJyNyGRbfnan
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="372651376"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="372651376"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 19:18:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="826160272"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="826160272"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Aug 2023 19:18:55 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYGys-0001E2-18;
	Tue, 22 Aug 2023 02:18:54 +0000
Date: Tue, 22 Aug 2023 10:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 26/30] net/ceph/osd_client.c:4556:46: error:
 'struct ceph_osd_linger_request' has no member named 'preply_pages'
Message-ID: <202308221049.KcMwe4pJ-lkp@intel.com>
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
commit: 99bc94d3d4c3bb466f113905cde8cce44da66d0a [26/30] ceph: Convert ceph_osdc_notify() reply to ceph_databuf
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230822/202308221049.KcMwe4pJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221049.KcMwe4pJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221049.KcMwe4pJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ceph/osd_client.c: In function 'handle_watch_notify':
>> net/ceph/osd_client.c:4556:46: error: 'struct ceph_osd_linger_request' has no member named 'preply_pages'
    4556 |                                         *lreq->preply_pages = data->pages;
         |                                              ^~
>> net/ceph/osd_client.c:4557:46: error: 'struct ceph_osd_linger_request' has no member named 'preply_len'
    4557 |                                         *lreq->preply_len = data->length;
         |                                              ^~


vim +4556 net/ceph/osd_client.c

a02a946dfe9633 Ilya Dryomov  2017-06-19  4490  
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4491  /*
922dab6134178c Ilya Dryomov  2016-05-26  4492   * Process osd watch notifications
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4493   */
922dab6134178c Ilya Dryomov  2016-05-26  4494  static void handle_watch_notify(struct ceph_osd_client *osdc,
922dab6134178c Ilya Dryomov  2016-05-26  4495  				struct ceph_msg *msg)
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4496  {
922dab6134178c Ilya Dryomov  2016-05-26  4497  	void *p = msg->front.iov_base;
922dab6134178c Ilya Dryomov  2016-05-26  4498  	void *const end = p + msg->front.iov_len;
922dab6134178c Ilya Dryomov  2016-05-26  4499  	struct ceph_osd_linger_request *lreq;
922dab6134178c Ilya Dryomov  2016-05-26  4500  	struct linger_work *lwork;
922dab6134178c Ilya Dryomov  2016-05-26  4501  	u8 proto_ver, opcode;
922dab6134178c Ilya Dryomov  2016-05-26  4502  	u64 cookie, notify_id;
922dab6134178c Ilya Dryomov  2016-05-26  4503  	u64 notifier_id = 0;
1907920324f1f3 Ilya Dryomov  2016-04-28  4504  	s32 return_code = 0;
922dab6134178c Ilya Dryomov  2016-05-26  4505  	void *payload = NULL;
922dab6134178c Ilya Dryomov  2016-05-26  4506  	u32 payload_len = 0;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4507  
922dab6134178c Ilya Dryomov  2016-05-26  4508  	ceph_decode_8_safe(&p, end, proto_ver, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4509  	ceph_decode_8_safe(&p, end, opcode, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4510  	ceph_decode_64_safe(&p, end, cookie, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4511  	p += 8; /* skip ver */
922dab6134178c Ilya Dryomov  2016-05-26  4512  	ceph_decode_64_safe(&p, end, notify_id, bad);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4513  
922dab6134178c Ilya Dryomov  2016-05-26  4514  	if (proto_ver >= 1) {
922dab6134178c Ilya Dryomov  2016-05-26  4515  		ceph_decode_32_safe(&p, end, payload_len, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4516  		ceph_decode_need(&p, end, payload_len, bad);
922dab6134178c Ilya Dryomov  2016-05-26  4517  		payload = p;
922dab6134178c Ilya Dryomov  2016-05-26  4518  		p += payload_len;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4519  	}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4520  
922dab6134178c Ilya Dryomov  2016-05-26  4521  	if (le16_to_cpu(msg->hdr.version) >= 2)
1907920324f1f3 Ilya Dryomov  2016-04-28  4522  		ceph_decode_32_safe(&p, end, return_code, bad);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4523  
922dab6134178c Ilya Dryomov  2016-05-26  4524  	if (le16_to_cpu(msg->hdr.version) >= 3)
922dab6134178c Ilya Dryomov  2016-05-26  4525  		ceph_decode_64_safe(&p, end, notifier_id, bad);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4526  
922dab6134178c Ilya Dryomov  2016-05-26  4527  	down_read(&osdc->lock);
922dab6134178c Ilya Dryomov  2016-05-26  4528  	lreq = lookup_linger_osdc(&osdc->linger_requests, cookie);
922dab6134178c Ilya Dryomov  2016-05-26  4529  	if (!lreq) {
922dab6134178c Ilya Dryomov  2016-05-26  4530  		dout("%s opcode %d cookie %llu dne\n", __func__, opcode,
922dab6134178c Ilya Dryomov  2016-05-26  4531  		     cookie);
922dab6134178c Ilya Dryomov  2016-05-26  4532  		goto out_unlock_osdc;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4533  	}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4534  
922dab6134178c Ilya Dryomov  2016-05-26  4535  	mutex_lock(&lreq->lock);
1907920324f1f3 Ilya Dryomov  2016-04-28  4536  	dout("%s opcode %d cookie %llu lreq %p is_watch %d\n", __func__,
1907920324f1f3 Ilya Dryomov  2016-04-28  4537  	     opcode, cookie, lreq, lreq->is_watch);
922dab6134178c Ilya Dryomov  2016-05-26  4538  	if (opcode == CEPH_WATCH_EVENT_DISCONNECT) {
922dab6134178c Ilya Dryomov  2016-05-26  4539  		if (!lreq->last_error) {
922dab6134178c Ilya Dryomov  2016-05-26  4540  			lreq->last_error = -ENOTCONN;
922dab6134178c Ilya Dryomov  2016-05-26  4541  			queue_watch_error(lreq);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4542  		}
1907920324f1f3 Ilya Dryomov  2016-04-28  4543  	} else if (!lreq->is_watch) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4544  		/* CEPH_WATCH_EVENT_NOTIFY_COMPLETE */
1907920324f1f3 Ilya Dryomov  2016-04-28  4545  		if (lreq->notify_id && lreq->notify_id != notify_id) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4546  			dout("lreq %p notify_id %llu != %llu, ignoring\n", lreq,
1907920324f1f3 Ilya Dryomov  2016-04-28  4547  			     lreq->notify_id, notify_id);
1907920324f1f3 Ilya Dryomov  2016-04-28  4548  		} else if (!completion_done(&lreq->notify_finish_wait)) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4549  			struct ceph_msg_data *data =
0d9c1ab3be4c01 Ilya Dryomov  2018-10-15  4550  			    msg->num_data_items ? &msg->data[0] : NULL;
1907920324f1f3 Ilya Dryomov  2016-04-28  4551  
1907920324f1f3 Ilya Dryomov  2016-04-28  4552  			if (data) {
99bc94d3d4c3bb David Howells 2023-08-03  4553  				if (lreq->reply) {
1907920324f1f3 Ilya Dryomov  2016-04-28  4554  					WARN_ON(data->type !=
1907920324f1f3 Ilya Dryomov  2016-04-28  4555  							CEPH_MSG_DATA_PAGES);
1907920324f1f3 Ilya Dryomov  2016-04-28 @4556  					*lreq->preply_pages = data->pages;
1907920324f1f3 Ilya Dryomov  2016-04-28 @4557  					*lreq->preply_len = data->length;
e886274031200b Ilya Dryomov  2020-03-10  4558  					data->own_pages = false;
1907920324f1f3 Ilya Dryomov  2016-04-28  4559  				}
1907920324f1f3 Ilya Dryomov  2016-04-28  4560  			}
1907920324f1f3 Ilya Dryomov  2016-04-28  4561  			lreq->notify_finish_error = return_code;
1907920324f1f3 Ilya Dryomov  2016-04-28  4562  			complete_all(&lreq->notify_finish_wait);
1907920324f1f3 Ilya Dryomov  2016-04-28  4563  		}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4564  	} else {
922dab6134178c Ilya Dryomov  2016-05-26  4565  		/* CEPH_WATCH_EVENT_NOTIFY */
922dab6134178c Ilya Dryomov  2016-05-26  4566  		lwork = lwork_alloc(lreq, do_watch_notify);
922dab6134178c Ilya Dryomov  2016-05-26  4567  		if (!lwork) {
922dab6134178c Ilya Dryomov  2016-05-26  4568  			pr_err("failed to allocate notify-lwork\n");
922dab6134178c Ilya Dryomov  2016-05-26  4569  			goto out_unlock_lreq;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4570  		}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4571  
922dab6134178c Ilya Dryomov  2016-05-26  4572  		lwork->notify.notify_id = notify_id;
922dab6134178c Ilya Dryomov  2016-05-26  4573  		lwork->notify.notifier_id = notifier_id;
922dab6134178c Ilya Dryomov  2016-05-26  4574  		lwork->notify.payload = payload;
922dab6134178c Ilya Dryomov  2016-05-26  4575  		lwork->notify.payload_len = payload_len;
922dab6134178c Ilya Dryomov  2016-05-26  4576  		lwork->notify.msg = ceph_msg_get(msg);
922dab6134178c Ilya Dryomov  2016-05-26  4577  		lwork_queue(lwork);
91883cd27c4e25 Ilya Dryomov  2014-09-11  4578  	}
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4579  
922dab6134178c Ilya Dryomov  2016-05-26  4580  out_unlock_lreq:
922dab6134178c Ilya Dryomov  2016-05-26  4581  	mutex_unlock(&lreq->lock);
922dab6134178c Ilya Dryomov  2016-05-26  4582  out_unlock_osdc:
922dab6134178c Ilya Dryomov  2016-05-26  4583  	up_read(&osdc->lock);
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4584  	return;
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4585  
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4586  bad:
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4587  	pr_err("osdc handle_watch_notify corrupt msg\n");
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4588  }
a40c4f10e3fb96 Yehuda Sadeh  2011-03-21  4589  

:::::: The code at line 4556 was first introduced by commit
:::::: 1907920324f1f3ebb6618344417c03a2863bba01 libceph: support for sending notifies

:::::: TO: Ilya Dryomov <idryomov@gmail.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
