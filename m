Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA8B376
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Mar 2024 00:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711066868; cv=none; b=hyNC8RSts83VPiWosurBEcRWKXbIloriqahMU3lSsSNNxoAYwhqooUzzBnsinWEr4MzuzRevhrrhqPvMrwRZxNlXkq5U/+axl/TjI/W2hajia9GcGxlUjBAK+5aNN9eplOQqt5pYnYBCJp8XoDNGCxlGWobgMB0X78J6zI3Iz2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711066868; c=relaxed/simple;
	bh=6dazZyrTUUxJ5nMw+Gco0Jzl83O4SWTc86SrPqVADag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A6UVH57HQwzogoxSDEKyjmsyuM3MA7/QkeHCk0bdYO6tOVDqdO+kwB5btBFVWN/IBt+3DqlWzRV3AiVBJOjv1toRHzhWSxysWIWJhss9OtjyuXogCMLwKj3ZlYfn0h5EtQYpil5x25Q7KavTN2kTXkx2t4Lxu4gW0LyWRU2AS3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3o5iloM; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3o5iloM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711066866; x=1742602866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dazZyrTUUxJ5nMw+Gco0Jzl83O4SWTc86SrPqVADag=;
  b=X3o5iloM6UUV9KMqgkfSWth7JTDHIYWqGpSpx5kcUDsODKScm8FNYrov
   x7pCrdDDOVPI/uHj2b4XKFaNyqTCj5KfO2I7aqhc8XBxgGvjXsMTB3gu9
   aVaK2zjTWnZllbS2RS2aog7Aw/7k9QMbCf9gspSuGBWFA/w4hBbZf2l3I
   4IpqicKRKsPqk9nVew/RgAw6I1YpmbXrvQL9cQLZ/+zsOnbmHCWGXM/ak
   ytcaiD2oQlZCbUBMiVVXa/DDaqKJkdJm5DyVXXVEvUIIW+NplnxGlLQ3Y
   r1o36i2ti/Y+iQuxSEFqJ5gDmU60PfLHAwjrReTj6YA+fGVYw0ZCFE4Tq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="5929323"
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="5929323"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 17:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,144,1708416000"; 
   d="scan'208";a="14675348"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Mar 2024 17:21:04 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnSeb-000Jsd-2m;
	Fri, 22 Mar 2024 00:21:01 +0000
Date: Fri, 22 Mar 2024 08:20:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_prototype_v1 78/79]
 net/mptcp/protocol.c:1837:31: warning: variable 'poffset' set but not used
Message-ID: <202403220853.nl8BunZ9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_prototype_v1
head:   9c723b3a1494f573ebeb6bab7c3b78459bb31c9a
commit: 6ae38e319d283fb5361b24f2d0e3b2501f1b9ade [78/79] net: replace page_frag with page_frag_cache
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20240322/202403220853.nl8BunZ9-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240322/202403220853.nl8BunZ9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403220853.nl8BunZ9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   net/mptcp/protocol.c: In function 'mptcp_sendmsg':
>> net/mptcp/protocol.c:1837:31: warning: variable 'poffset' set but not used [-Wunused-but-set-variable]
    1837 |                 size_t psize, poffset;
         |                               ^~~~~~~


vim +/poffset +1837 net/mptcp/protocol.c

  1792	
  1793	static int mptcp_sendmsg(struct sock *sk, struct msghdr *msg, size_t len)
  1794	{
  1795		struct mptcp_sock *msk = mptcp_sk(sk);
  1796		struct page_frag_cache *pfrag;
  1797		size_t copied = 0;
  1798		int ret = 0;
  1799		long timeo;
  1800	
  1801		/* silently ignore everything else */
  1802		msg->msg_flags &= MSG_MORE | MSG_DONTWAIT | MSG_NOSIGNAL | MSG_FASTOPEN;
  1803	
  1804		lock_sock(sk);
  1805	
  1806		if (unlikely(inet_test_bit(DEFER_CONNECT, sk) ||
  1807			     msg->msg_flags & MSG_FASTOPEN)) {
  1808			int copied_syn = 0;
  1809	
  1810			ret = mptcp_sendmsg_fastopen(sk, msg, len, &copied_syn);
  1811			copied += copied_syn;
  1812			if (ret == -EINPROGRESS && copied_syn > 0)
  1813				goto out;
  1814			else if (ret)
  1815				goto do_error;
  1816		}
  1817	
  1818		timeo = sock_sndtimeo(sk, msg->msg_flags & MSG_DONTWAIT);
  1819	
  1820		if ((1 << sk->sk_state) & ~(TCPF_ESTABLISHED | TCPF_CLOSE_WAIT)) {
  1821			ret = sk_stream_wait_connect(sk, &timeo);
  1822			if (ret)
  1823				goto do_error;
  1824		}
  1825	
  1826		ret = -EPIPE;
  1827		if (unlikely(sk->sk_err || (sk->sk_shutdown & SEND_SHUTDOWN)))
  1828			goto do_error;
  1829	
  1830		pfrag = sk_page_frag(sk);
  1831	
  1832		while (msg_data_left(msg)) {
  1833			int total_ts, frag_truesize = 0;
  1834			struct mptcp_data_frag *dfrag;
  1835			bool dfrag_collapsed = false;
  1836			unsigned int offset, size;
> 1837			size_t psize, poffset;
  1838			struct page *page;
  1839			u32 copy_limit;
  1840			void *va;
  1841	
  1842			/* ensure fitting the notsent_lowat() constraint */
  1843			copy_limit = mptcp_send_limit(sk);
  1844			if (!copy_limit)
  1845				goto wait_for_memory;
  1846	
  1847			/* reuse tail pfrag, if possible, or carve a new one from the
  1848			 * page allocator
  1849			 */
  1850			dfrag = mptcp_pending_tail(sk);
  1851			size = 32U;
  1852			va = mptcp_page_frag_alloc_prepare(sk, pfrag, &size, &offset);
  1853			if (!va)
  1854				goto wait_for_memory;
  1855	
  1856			page = virt_to_page(va);
  1857			dfrag_collapsed = mptcp_frag_can_collapse_to(msk, page, offset,
  1858								     dfrag);
  1859			if (!dfrag_collapsed) {
  1860				size = 32U + sizeof(struct mptcp_data_frag);
  1861				va = mptcp_page_frag_alloc_prepare(sk, pfrag, &size,
  1862								   &offset);
  1863				if (!va)
  1864					goto wait_for_memory;
  1865	
  1866				page = virt_to_page(va);
  1867				dfrag = mptcp_carve_data_frag(msk, page, offset);
  1868				frag_truesize = dfrag->overhead;
  1869			}
  1870	
  1871			/* we do not bound vs wspace, to allow a single packet.
  1872			 * memory accounting will prevent execessive memory usage
  1873			 * anyway
  1874			 */
  1875			poffset = dfrag->offset + dfrag->data_len;
  1876			psize = size - frag_truesize;
  1877			psize = min_t(size_t, psize, msg_data_left(msg));
  1878			psize = min_t(size_t, psize, copy_limit);
  1879			total_ts = psize + frag_truesize;
  1880	
  1881			if (!sk_wmem_schedule(sk, total_ts))
  1882				goto wait_for_memory;
  1883	
  1884			ret = do_copy_data_nocache(sk, psize, &msg->msg_iter,
  1885						   va + offset);
  1886			if (ret)
  1887				goto do_error;
  1888	
  1889			/* data successfully copied into the write queue */
  1890			sk_forward_alloc_add(sk, -total_ts);
  1891			copied += psize;
  1892			dfrag->data_len += psize;
  1893			frag_truesize += psize;
  1894			WRITE_ONCE(msk->write_seq, msk->write_seq + psize);
  1895	
  1896			/* charge data on mptcp pending queue to the msk socket
  1897			 * Note: we charge such data both to sk and ssk
  1898			 */
  1899			sk_wmem_queued_add(sk, frag_truesize);
  1900			if (!dfrag_collapsed) {
  1901				page_frag_alloc_commit(pfrag, offset, frag_truesize);
  1902				list_add_tail(&dfrag->list, &msk->rtx_queue);
  1903				if (!msk->first_pending)
  1904					WRITE_ONCE(msk->first_pending, dfrag);
  1905			} else {
  1906				page_frag_alloc_commit_noref(pfrag, offset,
  1907							     frag_truesize);
  1908			}
  1909	
  1910			pr_debug("msk=%p dfrag at seq=%llu len=%u sent=%u new=%d", msk,
  1911				 dfrag->data_seq, dfrag->data_len, dfrag->already_sent,
  1912				 !dfrag_collapsed);
  1913	
  1914			continue;
  1915	
  1916	wait_for_memory:
  1917			set_bit(SOCK_NOSPACE, &sk->sk_socket->flags);
  1918			__mptcp_push_pending(sk, msg->msg_flags);
  1919			ret = sk_stream_wait_memory(sk, &timeo);
  1920			if (ret)
  1921				goto do_error;
  1922		}
  1923	
  1924		if (copied)
  1925			__mptcp_push_pending(sk, msg->msg_flags);
  1926	
  1927	out:
  1928		release_sock(sk);
  1929		return copied;
  1930	
  1931	do_error:
  1932		if (copied)
  1933			goto out;
  1934	
  1935		copied = sk_stream_error(sk, msg->msg_flags, ret);
  1936		goto out;
  1937	}
  1938	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
