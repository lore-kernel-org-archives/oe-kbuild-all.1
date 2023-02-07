Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C61D566F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 17:08:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675789692; x=1707325692;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yH6Wwz3ZZw5Av4IeTLBRjMyIIgfqSbdQA1nrEuy12Ac=;
  b=fUcdwOgVqAHvvELciNoDZ5VyhwPwAXCl2QwNOPJIKsduqc0Xr9DzemVR
   PwjRDctWUVLYA2aE62zTZdJgrtPeGGIWMYdw1gCLdB44kQbyLNWuQDH2L
   s1SW29UzN1o0NmfHfr1Mdu3LSIZ4I34kaiGImTKzvSIjjlc2SVR4NjV5e
   QGowhzTsIz5mS5O0enf/IbZAgeQ8jWiL28vB3LyF+TErHC14DuPcTfRQR
   uaFHVE8JHz0NjORlW8ez/o7mfkTjqH9m//vWgWyuRADVnkPlPu+amZBuX
   L/TweuUDStxuv2AdIq16ncKzUUEB8PM9OYMGSZ54bne49GaZBgvPRepcK
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="328209981"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="328209981"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 09:06:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="755687590"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="755687590"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Feb 2023 09:05:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPRP8-0003jW-39;
	Tue, 07 Feb 2023 17:05:14 +0000
Date: Wed, 08 Feb 2023 01:04:21 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: Josh Triplett <josh@joshtriplett.org>, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev
Subject: [lkp] [+906 bytes kernel size regression] [i386-tinyconfig]
 [093a3d80e1] iov_iter: Add a function to extract a page list from an
 iterator
Message-ID: <63e28495.fFPZYIjkuSAZmjxA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


FYI, we noticed a +906 bytes kernel size regression due to commit:

commit: 093a3d80e19db28bb7a241b60d15cf744ecd5aaf (iov_iter: Add a function to extract a page list from an iterator)
https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/iov-extract


Details as below (size data is obtained by `nm --size-sort vmlinux`):

39022e3d: iov_iter: Define flags to qualify page extraction.
093a3d80: iov_iter: Add a function to extract a page list from an iterator

+---------------------------------+----------+----------+-------+
|             symbol              | 39022e3d | 093a3d80 | delta |
+---------------------------------+----------+----------+-------+
| nm.T.iov_iter_extract_pages     | 0        | 892      | 892   |
| bzImage                         | 495104   | 495648   | 544   |
| nm.t.iter_xarray_get_pages      | 0        | 328      | 328   |
| nm.t.first_iovec_segment        | 0        | 71       | 71    |
| nm.t.__iov_iter_get_pages_alloc | 543      | 445      | -98   |
| nm.t.iter_xarray_populate_pages | 287      | 0        | -287  |
+---------------------------------+----------+----------+-------+



Thanks

