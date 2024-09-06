Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9711B85D1
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 19:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725651596; cv=none; b=hMS2zmPaMO6P1N15ArUwwEUZexTkQo6NQ3ONYtRVBHmbWdjTygbvcX6mMPG35EzwHTFMmqX/gMZe7pTD9PqwQlO4+fGAdc94OZQ0YCWeS1GBvb/MGDnxhQUekXebvYNeM3LbZoGW2IUt8yDZyAQlkwtp73YXpLi60QfpECzTRtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725651596; c=relaxed/simple;
	bh=sxejSd5Y8/4QbnoqiqA/8C7hpVlstXX8ICyfFRie7PY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ELs6aovOrXW8Q6lt7rok1NVXyqh2DdYe82CCWfRpRj49v5VZync7HiVMoFs/8A1n1xWPopNeJxuzI1jAXhsSr/LO7gfLEHz8tqMOJ+hqAYcUmem2bofDJU1Ja4jyMyNd0nwSMeEA2yEpZMO05VJfrTt9LkhrO29aqRF/mWoDvLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e8FNCk0I; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8FNCk0I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725651594; x=1757187594;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sxejSd5Y8/4QbnoqiqA/8C7hpVlstXX8ICyfFRie7PY=;
  b=e8FNCk0Ih9vwl0i3oTpBt3D4Cg0Qf7SqMWC+89j4mvX+jm4WdKUM6cRm
   WsFwjQP98yJvbpq1053k8VitcA8gFgohqnKpJjjxO0sAUivAy6834cI+m
   Q47hjOTZwn8+fXzGIs4hRev/sKqELcEVAxsy219MLoKvtZAz0WHwrCbCr
   EW/ARdli/KjEABDadfzeK8sYF46UZtTIahBHjoRVI7cyLMY4Ncrkak1U9
   goBRpNkSUOHFqlTi89eeQ043fQYPUYgKrp3EsVAeoyLqjGHmZdVjhhK7j
   +ESfDEjnDa6PsAgfbl25rAlajGFp9rPmMvzeUxVS2PBOGqP+g8ZeDgKdW
   A==;
X-CSE-ConnectionGUID: 5iFAErR+S62LUPgkkvdlVg==
X-CSE-MsgGUID: LOki3/t2QOmFTMM6KNq0Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11187"; a="24287832"
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="24287832"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 12:39:53 -0700
X-CSE-ConnectionGUID: qVtelZ/mQ12/pT5JhG4q+A==
X-CSE-MsgGUID: cU5K0BkATiCSuyWWCeMH7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,208,1719903600"; 
   d="scan'208";a="66287418"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 Sep 2024 12:39:52 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smeoA-000BeN-04;
	Fri, 06 Sep 2024 19:39:50 +0000
Date: Sat, 7 Sep 2024 03:39:31 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 10093/10296] fs/smb/client/cifssmb.c:1329:33:
 error: no member named 'actual_len' in 'struct cifs_io_subrequest'
Message-ID: <202409070303.zc0N8RFv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: a58e60d6975bbd347715ec6e800ee44a3e62cd4f [10093/10296] Merge branch 'vfs.all' of git://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20240907/202409070303.zc0N8RFv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409070303.zc0N8RFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409070303.zc0N8RFv-lkp@intel.com/

Note: the linux-next/master HEAD 9aaeb87ce1e966169a57f53a02ba05b30880ffb8 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> fs/smb/client/cifssmb.c:1329:33: error: no member named 'actual_len' in 'struct cifs_io_subrequest'
    1329 |                 if (rdata->got_bytes < rdata->actual_len &&
         |                                        ~~~~~  ^
   1 error generated.


vim +1329 fs/smb/client/cifssmb.c

a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1272  
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1273  static void
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1274  cifs_readv_callback(struct mid_q_entry *mid)
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1275  {
753b67eb630db3 fs/smb/client/cifssmb.c David Howells   2022-03-09  1276  	struct cifs_io_subrequest *rdata = mid->callback_data;
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1277  	struct netfs_inode *ictx = netfs_inode(rdata->rreq->inode);
3ee1a1fc398199 fs/smb/client/cifssmb.c David Howells   2023-10-06  1278  	struct cifs_tcon *tcon = tlink_tcon(rdata->req->cfile->tlink);
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1279  	struct TCP_Server_Info *server = tcon->ses->server;
738f9de5cdb917 fs/cifs/cifssmb.c       Pavel Shilovsky 2016-11-23  1280  	struct smb_rqst rqst = { .rq_iov = rdata->iov,
738f9de5cdb917 fs/cifs/cifssmb.c       Pavel Shilovsky 2016-11-23  1281  				 .rq_nvec = 2,
ab58fbdeebc7f9 fs/smb/client/cifssmb.c David Howells   2023-10-06  1282  				 .rq_iter = rdata->subreq.io_iter };
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1283  	struct cifs_credits credits = {
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1284  		.value = 1,
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1285  		.instance = 0,
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1286  		.rreq_debug_id = rdata->rreq->debug_id,
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1287  		.rreq_debug_index = rdata->subreq.debug_index,
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1288  	};
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1289  
ab58fbdeebc7f9 fs/smb/client/cifssmb.c David Howells   2023-10-06  1290  	cifs_dbg(FYI, "%s: mid=%llu state=%d result=%d bytes=%zu\n",
f96637be081141 fs/cifs/cifssmb.c       Joe Perches     2013-05-04  1291  		 __func__, mid->mid, mid->mid_state, rdata->result,
ab58fbdeebc7f9 fs/smb/client/cifssmb.c David Howells   2023-10-06  1292  		 rdata->subreq.len);
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1293  
7c9421e1a9ce8d fs/cifs/cifssmb.c       Pavel Shilovsky 2012-03-23  1294  	switch (mid->mid_state) {
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1295  	case MID_RESPONSE_RECEIVED:
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1296  		/* result already set, check signature */
38d77c50b4f4e3 fs/cifs/cifssmb.c       Jeff Layton     2013-05-26  1297  		if (server->sign) {
985e4ff016b5f3 fs/cifs/cifssmb.c       Steve French    2012-08-03  1298  			int rc = 0;
985e4ff016b5f3 fs/cifs/cifssmb.c       Steve French    2012-08-03  1299  
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1300  			iov_iter_truncate(&rqst.rq_iter, rdata->got_bytes);
bf5ea0e2f29b00 fs/cifs/cifssmb.c       Jeff Layton     2012-09-18  1301  			rc = cifs_verify_signature(&rqst, server,
0124cc45113f93 fs/cifs/cifssmb.c       Jeff Layton     2013-04-03  1302  						  mid->sequence_number);
985e4ff016b5f3 fs/cifs/cifssmb.c       Steve French    2012-08-03  1303  			if (rc)
f96637be081141 fs/cifs/cifssmb.c       Joe Perches     2013-05-04  1304  				cifs_dbg(VFS, "SMB signature verification returned error = %d\n",
f96637be081141 fs/cifs/cifssmb.c       Joe Perches     2013-05-04  1305  					 rc);
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1306  		}
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1307  		/* FIXME: should this be counted toward the initiating task? */
34a54d617785e5 fs/cifs/cifssmb.c       Pavel Shilovsky 2014-07-10  1308  		task_io_account_read(rdata->got_bytes);
34a54d617785e5 fs/cifs/cifssmb.c       Pavel Shilovsky 2014-07-10  1309  		cifs_stats_bytes_read(tcon, rdata->got_bytes);
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1310  		break;
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1311  	case MID_REQUEST_SUBMITTED:
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1312  	case MID_RETRY_NEEDED:
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1313  		rdata->result = -EAGAIN;
d913ed17f0a7d7 fs/cifs/cifssmb.c       Pavel Shilovsky 2014-07-10  1314  		if (server->sign && rdata->got_bytes)
d913ed17f0a7d7 fs/cifs/cifssmb.c       Pavel Shilovsky 2014-07-10  1315  			/* reset bytes number since we can not check a sign */
d913ed17f0a7d7 fs/cifs/cifssmb.c       Pavel Shilovsky 2014-07-10  1316  			rdata->got_bytes = 0;
d913ed17f0a7d7 fs/cifs/cifssmb.c       Pavel Shilovsky 2014-07-10  1317  		/* FIXME: should this be counted toward the initiating task? */
d913ed17f0a7d7 fs/cifs/cifssmb.c       Pavel Shilovsky 2014-07-10  1318  		task_io_account_read(rdata->got_bytes);
d913ed17f0a7d7 fs/cifs/cifssmb.c       Pavel Shilovsky 2014-07-10  1319  		cifs_stats_bytes_read(tcon, rdata->got_bytes);
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1320  		break;
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1321  	default:
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1322  		rdata->result = -EIO;
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1323  	}
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1324  
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1325  	if (rdata->result == -ENODATA) {
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1326  		__set_bit(NETFS_SREQ_HIT_EOF, &rdata->subreq.flags);
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1327  		rdata->result = 0;
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1328  	} else {
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03 @1329  		if (rdata->got_bytes < rdata->actual_len &&
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1330  		    rdata->subreq.start + rdata->subreq.transferred + rdata->got_bytes ==
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1331  		    ictx->remote_i_size) {
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1332  			__set_bit(NETFS_SREQ_HIT_EOF, &rdata->subreq.flags);
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1333  			rdata->result = 0;
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1334  		}
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1335  	}
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1336  
3ee1a1fc398199 fs/smb/client/cifssmb.c David Howells   2023-10-06  1337  	rdata->credits.value = 0;
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1338  	INIT_WORK(&rdata->subreq.work, cifs_readv_worker);
a68c74865f517e fs/smb/client/cifssmb.c David Howells   2024-09-03  1339  	queue_work(cifsiod_wq, &rdata->subreq.work);
70f08f914a37a0 fs/cifs/cifssmb.c       Enzo Matsumiya  2022-08-05  1340  	release_mid(mid);
34f4deb7c56c6f fs/cifs/cifssmb.c       Pavel Shilovsky 2019-01-16  1341  	add_credits(server, &credits, 0);
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1342  }
e28bc5b1fdbd6e fs/cifs/cifssmb.c       Jeff Layton     2011-10-19  1343  

:::::: The code at line 1329 was first introduced by commit
:::::: a68c74865f517e26728735aba0ae05055eaff76c cifs: Fix SMB1 readv/writev callback in the same way as SMB2/3

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
