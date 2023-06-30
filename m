Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391A810796
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 13:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688130929; x=1719666929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qMTu/ur7tlqh/r9XmDys0pLLocOK+GNnhNjUU6ppWzQ=;
  b=fRlFghxbnVdpBFEPeuF+UUsA3a1JyDO9i9D1rVielTxBxFCCHyxjJF9B
   Vz5g2zXKgRqn+77vFZyI1eEoZ7w63PUF8IBtvGf96W+MY5ulh6qsffviF
   lRSc6b/hMUx2euY1tHxHIoX8DIL4K7TfTeeGysGz8rUOhlJZlInmqjYew
   A3STs1i0D8vCZ6FlB1Ngs/Wv8Fp2oLRcKd/+WC39LkNbcpSklws24p2dF
   tAjuFVN7DJyFNFSJIuI8jgc57mkKQSQEUfU7IktzhPaR+N4FkM84uX8Ef
   qRBwYT6/VvjCaweerCaNVZp1CB7zIWW/a0HDL7gkAPUAMzICdJ9qgoH9I
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="393116325"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="393116325"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 06:15:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="807773001"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; 
   d="scan'208";a="807773001"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2023 06:15:27 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFDyA-000Eyv-1L;
	Fri, 30 Jun 2023 13:15:26 +0000
Date: Fri, 30 Jun 2023 21:14:55 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-extract 17/20] fs/nfs/direct.c:339:49: error:
 'WRITE_TO_ITER' undeclared; did you mean 'WRITE_ONCE'?
Message-ID: <202306302116.GpLBjMFY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-extract
head:   19ee2529bb48ab3bba1d2cfc7a0811ae08a22505
commit: 9b9620b5c075475d9da8e6e6a03f00bd5d2147fe [17/20] nfs: Pin pages rather than ref'ing if appropriate
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230630/202306302116.GpLBjMFY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230630/202306302116.GpLBjMFY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306302116.GpLBjMFY-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/direct.c: In function 'nfs_direct_read_schedule_iovec':
>> fs/nfs/direct.c:339:49: error: 'WRITE_TO_ITER' undeclared (first use in this function); did you mean 'WRITE_ONCE'?
     339 |                                                 WRITE_TO_ITER, &pgbase);
         |                                                 ^~~~~~~~~~~~~
         |                                                 WRITE_ONCE
   fs/nfs/direct.c:339:49: note: each undeclared identifier is reported only once for each function it appears in
   fs/nfs/direct.c: In function 'nfs_direct_write_schedule_iovec':
>> fs/nfs/direct.c:797:49: error: 'READ_FROM_ITER' undeclared (first use in this function)
     797 |                                                 READ_FROM_ITER, &pgbase);
         |                                                 ^~~~~~~~~~~~~~
>> fs/nfs/direct.c:833:42: error: implicit declaration of function 'iov_iter_extract_mode'; did you mean 'iov_iter_extract_pages'? [-Werror=implicit-function-declaration]
     833 |                                          iov_iter_extract_mode(iter, FOLL_SOURCE_BUF));
         |                                          ^~~~~~~~~~~~~~~~~~~~~
         |                                          iov_iter_extract_pages
>> fs/nfs/direct.c:833:70: error: 'FOLL_SOURCE_BUF' undeclared (first use in this function); did you mean 'IORESOURCE_BUS'?
     833 |                                          iov_iter_extract_mode(iter, FOLL_SOURCE_BUF));
         |                                                                      ^~~~~~~~~~~~~~~
         |                                                                      IORESOURCE_BUS
   cc1: some warnings being treated as errors


vim +339 fs/nfs/direct.c

   307	
   308	/*
   309	 * For each rsize'd chunk of the user's buffer, dispatch an NFS READ
   310	 * operation.  If nfs_readdata_alloc() or get_user_pages() fails,
   311	 * bail and stop sending more reads.  Read length accounting is
   312	 * handled automatically by nfs_direct_read_result().  Otherwise, if
   313	 * no requests have been sent, just return an error.
   314	 */
   315	
   316	static ssize_t nfs_direct_read_schedule_iovec(struct nfs_direct_req *dreq,
   317						      struct iov_iter *iter,
   318						      loff_t pos)
   319	{
   320		struct nfs_pageio_descriptor desc;
   321		struct inode *inode = dreq->inode;
   322		ssize_t result = -EINVAL;
   323		size_t requested_bytes = 0;
   324		size_t rsize = max_t(size_t, NFS_SERVER(inode)->rsize, PAGE_SIZE);
   325	
   326		nfs_pageio_init_read(&desc, dreq->inode, false,
   327				     &nfs_direct_read_completion_ops);
   328		get_dreq(dreq);
   329		desc.pg_dreq = dreq;
   330		inode_dio_begin(inode);
   331	
   332		while (iov_iter_count(iter)) {
   333			struct page **pagevec = NULL;
   334			size_t bytes;
   335			size_t pgbase;
   336			unsigned npages, i;
   337	
   338			result = iov_iter_extract_pages(iter, &pagevec, rsize, INT_MAX,
 > 339							WRITE_TO_ITER, &pgbase);
   340			if (result < 0)
   341				break;
   342	
   343			bytes = result;
   344			npages = (result + pgbase + PAGE_SIZE - 1) / PAGE_SIZE;
   345			for (i = 0; i < npages; i++) {
   346				struct nfs_page *req;
   347				unsigned int req_len = min_t(size_t, bytes, PAGE_SIZE - pgbase);
   348				/* XXX do we need to do the eof zeroing found in async_filler? */
   349				req = nfs_page_create_from_page(dreq->ctx, pagevec[i],
   350								pgbase, pos, req_len);
   351				if (IS_ERR(req)) {
   352					result = PTR_ERR(req);
   353					break;
   354				}
   355				if (!nfs_pageio_add_request(&desc, req)) {
   356					result = desc.pg_error;
   357					nfs_release_request(req);
   358					break;
   359				}
   360				pgbase = 0;
   361				bytes -= req_len;
   362				requested_bytes += req_len;
   363				pos += req_len;
   364				dreq->bytes_left -= req_len;
   365			}
   366			nfs_direct_release_pages(pagevec, npages,
   367						 iov_iter_extract_will_pin(iter));
   368			kvfree(pagevec);
   369			if (result < 0)
   370				break;
   371		}
   372	
   373		nfs_pageio_complete(&desc);
   374	
   375		/*
   376		 * If no bytes were started, return the error, and let the
   377		 * generic layer handle the completion.
   378		 */
   379		if (requested_bytes == 0) {
   380			inode_dio_end(inode);
   381			nfs_direct_req_release(dreq);
   382			return result < 0 ? result : -EIO;
   383		}
   384	
   385		if (put_dreq(dreq))
   386			nfs_direct_complete(dreq);
   387		return requested_bytes;
   388	}
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
