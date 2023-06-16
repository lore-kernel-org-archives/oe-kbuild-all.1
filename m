Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5551775C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 15:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686930162; x=1718466162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZMakjiuhTqydI0MvvFQYaPokx2Sti0rmVYUmkPHVpeg=;
  b=A60my9yzPuJWMDHHVaRhaUL7r4mtVLkjcpcsXbGOCNwA4ePmy+X7vsC+
   nw/4Z/7wpcpbhAvpA/WnKP4DkPvbUWeXF63LyDFMwjb1WDF0SwmACblu8
   tCsIsVm1qUvWn5KIn4mRtRzI4oNMSvLq6NTq2G3wLbgg3TR5v98lM10ok
   Rx4Su83/AfhzIFElO+LTw8Fg8HGP3cPlnYSDu6eC7pYtintZ/wacuClzS
   vXo6X2ma7iyxCdGg1jyqCy4x+6NY1GJ02YqZXwgIrh9PmrxDdh3ckTCTo
   YsXZX8JbcuL+e6j8glnKQlORLCGTpG/7jk3FSCEzlk6+gRoqFbjAaPXUj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="422893534"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="422893534"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 08:42:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="742712860"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="742712860"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Jun 2023 08:42:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qABax-0001V6-0P;
	Fri, 16 Jun 2023 15:42:39 +0000
Date: Fri, 16 Jun 2023 23:41:55 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Luis Chamberlain <mcgrof@kernel.org>
Subject: [mcgrof-next:large-block-20230616-hacks 37/38]
 fs/iomap/buffered-io.c:830:56: warning: suggest braces around empty body in
 an 'if' statement
Message-ID: <202306162311.8rwD3fds-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230616-hacks
head:   5416cb31017b28b25627f4f5b8292af96bb65f58
commit: ddf48d516b57d686874c57ffa3630ea19c4b7fdb [37/38] iomap: Copy larger chunks from userspace
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230616/202306162311.8rwD3fds-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306162311.8rwD3fds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306162311.8rwD3fds-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/iomap/buffered-io.c: In function 'iomap_write_iter':
>> fs/iomap/buffered-io.c:830:56: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     830 |                 if (bytes > folio_size(folio) - offset);
         |                                                        ^
>> fs/iomap/buffered-io.c:830:17: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
     830 |                 if (bytes > folio_size(folio) - offset);
         |                 ^~
   fs/iomap/buffered-io.c:831:25: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
     831 |                         bytes = folio_size(folio) - offset;
         |                         ^~~~~


vim +/if +830 fs/iomap/buffered-io.c

   780	
   781	static loff_t iomap_write_iter(struct iomap_iter *iter, struct iov_iter *i)
   782	{
   783		loff_t length = iomap_length(iter);
   784		size_t chunk = PAGE_SIZE << MAX_PAGECACHE_ORDER;
   785		loff_t pos = iter->pos;
   786		ssize_t written = 0;
   787		long status = 0;
   788		struct address_space *mapping = iter->inode->i_mapping;
   789		unsigned int bdp_flags = (iter->flags & IOMAP_NOWAIT) ? BDP_ASYNC : 0;
   790	
   791		do {
   792			struct folio *folio;
   793			size_t offset;		/* Offset into folio */
   794			unsigned long bytes;	/* Bytes to write to folio */
   795			size_t copied;		/* Bytes copied from user */
   796	
   797	again:
   798			offset = pos & (chunk - 1);
   799			bytes = min(chunk - offset, iov_iter_count(i));
   800			status = balance_dirty_pages_ratelimited_flags(mapping,
   801								       bdp_flags);
   802			if (unlikely(status))
   803				break;
   804	
   805			if (bytes > length)
   806				bytes = length;
   807	
   808			/*
   809			 * Bring in the user page that we'll copy from _first_.
   810			 * Otherwise there's a nasty deadlock on copying from the
   811			 * same page as we're writing to, without it being marked
   812			 * up-to-date.
   813			 *
   814			 * For async buffered writes the assumption is that the user
   815			 * page has already been faulted in. This can be optimized by
   816			 * faulting the user page.
   817			 */
   818			if (unlikely(fault_in_iov_iter_readable(i, bytes) == bytes)) {
   819				status = -EFAULT;
   820				break;
   821			}
   822	
   823			status = iomap_write_begin(iter, pos, bytes, &folio);
   824			if (unlikely(status))
   825				break;
   826			if (iter->iomap.flags & IOMAP_F_STALE)
   827				break;
   828	
   829			offset = offset_in_folio(folio, pos);
 > 830			if (bytes > folio_size(folio) - offset);
   831				bytes = folio_size(folio) - offset;
   832	
   833			if (mapping_writably_mapped(mapping))
   834				flush_dcache_folio(folio);
   835	
   836			copied = copy_page_from_iter_atomic(&folio->page, offset, bytes, i);
   837	
   838			status = iomap_write_end(iter, pos, bytes, copied, folio);
   839	
   840			if (unlikely(copied != status))
   841				iov_iter_revert(i, copied - status);
   842	
   843			cond_resched();
   844			if (unlikely(status == 0)) {
   845				/*
   846				 * A short copy made iomap_write_end() reject the
   847				 * thing entirely.  Might be memory poisoning
   848				 * halfway through, might be a race with munmap,
   849				 * might be severe memory pressure.
   850				 */
   851				if (copied)
   852					bytes = copied;
   853				if (chunk > PAGE_SIZE)
   854					chunk /= 2;
   855				goto again;
   856			}
   857			pos += status;
   858			written += status;
   859			length -= status;
   860		} while (iov_iter_count(i) && length);
   861	
   862		if (status == -EAGAIN) {
   863			iov_iter_revert(i, written);
   864			return -EAGAIN;
   865		}
   866		return written ? written : status;
   867	}
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
