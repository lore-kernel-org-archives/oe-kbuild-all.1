Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225278F5F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 16:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676305588; x=1707841588;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Mhqn7XyohSsO1uMINJTSHE8BQhiCGDwhiUBGRmonQfI=;
  b=Z7B+JPPjn7A260QACoUSlgKkuMe92f7waRcm+4NUqXlRDFamh3oEaDiC
   v8T0P/tugdLdFoCe2EJERZZBQU8hZcoaagCFdJlBbgoLxCINIg8mh2h7X
   6H87Qpg/8XeQo1MO0JTyA7q0HdwAcKesXFQ5ahy1/l+BseFjyr5DRbyqG
   0dHXT/NV/9tvapiSq98dos6O0jq+SH6kwp97WFnTfEHyRNh6+jvzUKnoy
   YMuiweOYXW626Anpl2x1XMCPesCyR3C/lOqcv27XvGE0zeI2oSNzhfuWq
   tijhpmlt18K4Nv+tkdPIDpqtudZ+5TskiEzVl9wszUKvk3ATQYhVMBphP
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="328633212"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="328633212"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 08:26:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="997742678"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="997742678"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2023 08:26:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRber-0007s5-2F;
	Mon, 13 Feb 2023 16:26:25 +0000
Date: Tue, 14 Feb 2023 00:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+538 bytes kernel size regression] [i386-tinyconfig]
 [d9722a4757] splice: Do splice read from a buffered file without using
 ITER_PIPE
Message-ID: <63ea6483.I9rGNdlQt1aW8bNm%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +538 bytes kernel size regression due to commit:

commit: d9722a47571104f7fa1eeb5ec59044d3607c6070 (splice: Do splice read from a buffered file without using ITER_PIPE)
https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-extract-3


Details as below (size data is obtained by `nm --size-sort vmlinux`):

cd119d2f: mm: Pass info, not iter, into filemap_get_pages() and unstatic it
d9722a47: splice: Do splice read from a buffered file without using ITER_PIPE

+----------------------------------------+----------+----------+-------+
|                 symbol                 | cd119d2f | d9722a47 | delta |
+----------------------------------------+----------+----------+-------+
| nm.t.generic_file_buffered_splice_read | 0        | 680      | 680   |
| bzImage                                | 496352   | 496640   | 288   |
| nm.T.generic_file_splice_read          | 200      | 58       | -142  |
+----------------------------------------+----------+----------+-------+



Thanks

