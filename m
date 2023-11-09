Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE0220B1F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 16:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q/SpjqsM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699546407; x=1731082407;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wkcdUOlLnNqbWAZ91naJupSPlaSKQ6M7kF1m44fwB6I=;
  b=Q/SpjqsM1sW5p6VYz37xHGP5zQdyGT67hogI96kB3gL21S8uIqTUuKY0
   2XowNhp5QZxgMAoeLMD/qZKAbWSjKfLE5J+/TtEogDgIwJDcHNWhm0LXE
   jsMheroahVsBtSp22lgexU1t6Vaoe8DwIlapfCujazLLObPmy8JwyR1gI
   jdvTozfBEDNJ3QFE4LmobKq3gYpLJS/6HA/Xcm94PT802US2TfKKtL+fP
   OY1YB3gS71/J1K/nVLW/ss2sDIZ5R9fqkJHK0BNx1BsqRzbRhyp2dFgF3
   kyG9/Fjz0mTy3t0QqkjZVt1eVhTe6yjGWfY8SzLzbQZifqytnrOtDKpNX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11562147"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="11562147"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 08:13:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="887052432"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="887052432"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 09 Nov 2023 08:13:17 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r17ed-0008u2-0E;
	Thu, 09 Nov 2023 16:13:15 +0000
Date: Fri, 10 Nov 2023 00:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
	Robert Hu <robert.hu@intel.com>,
	Farrah Chen <farrah.chen@intel.com>,
	Danmei Wei <danmei.wei@intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Isaku Yamahata <isaku.yamahata@intel.com>,
	Michael Roth <michael.roth@amd.com>, linux-doc@vger.kernel.org
Subject: [kvm:guestmemfd 27/48] htmldocs:
 Documentation/filesystems/api-summary:74: ./fs/anon_inodes.c:167: WARNING:
 Unexpected indentation.
Message-ID: <202311092342.YM1LxaXz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git guestmemfd
head:   796edd062c7aeaf9aa58a13f914446cc2282e5a8
commit: 392201e2d6669b4cb2db021c990797ac3f4663c7 [27/48] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory
reproduce: (https://download.01.org/0day-ci/archive/20231109/202311092342.YM1LxaXz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311092342.YM1LxaXz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/filesystems/api-summary:74: ./fs/anon_inodes.c:167: WARNING: Unexpected indentation.
>> Documentation/filesystems/api-summary:74: ./fs/anon_inodes.c:168: WARNING: Block quote ends without a blank line; unexpected unindent.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
