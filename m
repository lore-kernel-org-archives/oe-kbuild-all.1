Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C8810F5
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Sep 2023 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693814237; x=1725350237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pnUq+crojZhEaKWg81Jlw7J9rAHtGTwJg7Rsgpc9nv4=;
  b=ggSE/LLHwzFwnyBm6Gpcw4w6SwUj1RH+Q6IGgwakdk/747nIqoXN84H3
   UPcL7oI3eDX3a7y8pGKE8/ijwBelolL5F51O9txi8qp1daRzWEWPWVTuB
   iHD36Ro47NzW+FUsV0eVbkVp3VnYON+wAuzSt4cJJFdMcNE0FGa8ujDcb
   jgAu2bmpxfC8molvo9jeFu+nQyfvJRSABozRWwYaXZK7PSsvKMIfrDGGX
   +mnOEkpYFk3zGfU7Iaan65r3jnQN8202tNng2Q/YzCgpJfTvp5TZawCxU
   oqgSRtxwgaN9mS+L78KP9Hp3/rkfZTK70RP1xnkHmRI8dLlWvq4llOS3p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="356859797"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="356859797"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 00:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="743852171"
X-IronPort-AV: E=Sophos;i="6.02,225,1688454000"; 
   d="scan'208";a="743852171"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 04 Sep 2023 00:57:15 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qd4SJ-0000Gd-1U;
	Mon, 04 Sep 2023 07:57:10 +0000
Date: Mon, 4 Sep 2023 15:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 36/75] fs/ksmbd/smb2pdu.c:6256:6:
 warning: variable 'fp' is used uninitialized whenever 'if' condition is true
Message-ID: <202309041503.n0ocfdC8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   685a3043e4703a119d750efb0a28138f371b3d69
commit: ca337bb24052afbd5eda2c3f1d7ee62fe35df484 [36/75] ksmbd: no response from compound read
config: s390-randconfig-001-20230904 (https://download.01.org/0day-ci/archive/20230904/202309041503.n0ocfdC8-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230904/202309041503.n0ocfdC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309041503.n0ocfdC8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/ksmbd/smb2pdu.c:7:
   In file included from include/linux/inetdevice.h:9:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from fs/ksmbd/smb2pdu.c:7:
   In file included from include/linux/inetdevice.h:9:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from fs/ksmbd/smb2pdu.c:7:
   In file included from include/linux/inetdevice.h:9:
   In file included from include/linux/ip.h:16:
   In file included from include/linux/skbuff.h:31:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> fs/ksmbd/smb2pdu.c:6256:6: warning: variable 'fp' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (work->next_smb2_rcv_hdr_off) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:6367:21: note: uninitialized use occurs here
           ksmbd_fd_put(work, fp);
                              ^~
   fs/ksmbd/smb2pdu.c:6256:2: note: remove the 'if' if its condition is always false
           if (work->next_smb2_rcv_hdr_off) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ksmbd/smb2pdu.c:6248:23: note: initialize the variable 'fp' to silence this warning
           struct ksmbd_file *fp;
                                ^
                                 = NULL
   13 warnings generated.


vim +6256 fs/ksmbd/smb2pdu.c

  6236	
  6237	/**
  6238	 * smb2_read() - handler for smb2 read from file
  6239	 * @work:	smb work containing read command buffer
  6240	 *
  6241	 * Return:	0 on success, otherwise error
  6242	 */
  6243	int smb2_read(struct ksmbd_work *work)
  6244	{
  6245		struct ksmbd_conn *conn = work->conn;
  6246		struct smb2_read_req *req;
  6247		struct smb2_read_rsp *rsp, *rsp_org;
  6248		struct ksmbd_file *fp;
  6249		loff_t offset;
  6250		size_t length, mincount;
  6251		ssize_t nbytes = 0, remain_bytes = 0;
  6252		int err = 0;
  6253	
  6254		rsp_org = work->response_buf;
  6255		WORK_BUFFERS(work, req, rsp);
> 6256		if (work->next_smb2_rcv_hdr_off) {
  6257			work->send_no_response = 1;
  6258			err = -EOPNOTSUPP;
  6259			goto out;
  6260		}
  6261	
  6262		if (test_share_config_flag(work->tcon->share_conf,
  6263					   KSMBD_SHARE_FLAG_PIPE)) {
  6264			ksmbd_debug(SMB, "IPC pipe read request\n");
  6265			return smb2_read_pipe(work);
  6266		}
  6267	
  6268		fp = ksmbd_lookup_fd_slow(work, le64_to_cpu(req->VolatileFileId),
  6269					  le64_to_cpu(req->PersistentFileId));
  6270		if (!fp) {
  6271			err = -ENOENT;
  6272			goto out;
  6273		}
  6274	
  6275		if (!(fp->daccess & (FILE_READ_DATA_LE | FILE_READ_ATTRIBUTES_LE))) {
  6276			pr_err("Not permitted to read : 0x%x\n", fp->daccess);
  6277			err = -EACCES;
  6278			goto out;
  6279		}
  6280	
  6281		offset = le64_to_cpu(req->Offset);
  6282		length = le32_to_cpu(req->Length);
  6283		mincount = le32_to_cpu(req->MinimumCount);
  6284	
  6285		if (length > conn->vals->max_read_size) {
  6286			ksmbd_debug(SMB, "limiting read size to max size(%u)\n",
  6287				    conn->vals->max_read_size);
  6288			err = -EINVAL;
  6289			goto out;
  6290		}
  6291	
  6292		ksmbd_debug(SMB, "filename %pd, offset %lld, len %zu\n",
  6293			    fp->filp->f_path.dentry, offset, length);
  6294	
  6295		work->aux_payload_buf = kvmalloc(length, GFP_KERNEL | __GFP_ZERO);
  6296		if (!work->aux_payload_buf) {
  6297			err = -ENOMEM;
  6298			goto out;
  6299		}
  6300	
  6301		nbytes = ksmbd_vfs_read(work, fp, length, &offset);
  6302		if (nbytes < 0) {
  6303			err = nbytes;
  6304			goto out;
  6305		}
  6306	
  6307		if ((nbytes == 0 && length != 0) || nbytes < mincount) {
  6308			kvfree(work->aux_payload_buf);
  6309			work->aux_payload_buf = NULL;
  6310			rsp->hdr.Status = STATUS_END_OF_FILE;
  6311			smb2_set_err_rsp(work);
  6312			ksmbd_fd_put(work, fp);
  6313			return 0;
  6314		}
  6315	
  6316		ksmbd_debug(SMB, "nbytes %zu, offset %lld mincount %zu\n",
  6317			    nbytes, offset, mincount);
  6318	
  6319		if (req->Channel == SMB2_CHANNEL_RDMA_V1_INVALIDATE ||
  6320		    req->Channel == SMB2_CHANNEL_RDMA_V1) {
  6321			/* write data to the client using rdma channel */
  6322			remain_bytes = smb2_read_rdma_channel(work, req,
  6323							      work->aux_payload_buf,
  6324							      nbytes);
  6325			kvfree(work->aux_payload_buf);
  6326			work->aux_payload_buf = NULL;
  6327	
  6328			nbytes = 0;
  6329			if (remain_bytes < 0) {
  6330				err = (int)remain_bytes;
  6331				goto out;
  6332			}
  6333		}
  6334	
  6335		rsp->StructureSize = cpu_to_le16(17);
  6336		rsp->DataOffset = 80;
  6337		rsp->Reserved = 0;
  6338		rsp->DataLength = cpu_to_le32(nbytes);
  6339		rsp->DataRemaining = cpu_to_le32(remain_bytes);
  6340		rsp->Reserved2 = 0;
  6341		inc_rfc1001_len(rsp_org, 16);
  6342		work->resp_hdr_sz = get_rfc1002_len(rsp_org) + 4;
  6343		work->aux_payload_sz = nbytes;
  6344		inc_rfc1001_len(rsp_org, nbytes);
  6345		ksmbd_fd_put(work, fp);
  6346		return 0;
  6347	
  6348	out:
  6349		if (err) {
  6350			if (err == -EISDIR)
  6351				rsp->hdr.Status = STATUS_INVALID_DEVICE_REQUEST;
  6352			else if (err == -EAGAIN)
  6353				rsp->hdr.Status = STATUS_FILE_LOCK_CONFLICT;
  6354			else if (err == -ENOENT)
  6355				rsp->hdr.Status = STATUS_FILE_CLOSED;
  6356			else if (err == -EACCES)
  6357				rsp->hdr.Status = STATUS_ACCESS_DENIED;
  6358			else if (err == -ESHARE)
  6359				rsp->hdr.Status = STATUS_SHARING_VIOLATION;
  6360			else if (err == -EINVAL)
  6361				rsp->hdr.Status = STATUS_INVALID_PARAMETER;
  6362			else
  6363				rsp->hdr.Status = STATUS_INVALID_HANDLE;
  6364	
  6365			smb2_set_err_rsp(work);
  6366		}
  6367		ksmbd_fd_put(work, fp);
  6368		return err;
  6369	}
  6370	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
