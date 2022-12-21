Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8451C17
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Dec 2022 02:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671590261; x=1703126261;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=fqFh9WRIdcZwu6xC+cE5qkJh2a3IarwiQ8SFtG479hY=;
  b=HoLafM3WT3JZBgAfgnYahqha2FSuexTxnYV15TWSTm8pI78UXW7TroUV
   p2gR+DsuLdrif/iJdqGpphSl0nY6UMFQY0fQbr+3tvVl/fNdKtDb5DFO3
   steEergKlLseXqPnPYINlTiTJBW3DcOGUpalzWs2uh7RWNfUH9H/630wb
   c8eSs9a7ioGgpjQge1viOmdpSxGXnEo9ZZtOkws6cTVmQVqWdRtqbb+hR
   4VowXC1Cm+09OpW2M8upVh13SUIzD+3Xs4OM/U3ar4cf357dEk/dxOP/X
   rZD4Ey3/05JJYQq3pMFZTkTXQvZBB95vF70cgFNI43ID5XN+k9o6kGEtM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="321675540"
X-IronPort-AV: E=Sophos;i="5.96,261,1665471600"; 
   d="scan'208";a="321675540"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2022 18:37:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681867738"
X-IronPort-AV: E=Sophos;i="5.96,261,1665471600"; 
   d="scan'208";a="681867738"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 20 Dec 2022 18:37:38 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p7ozB-0009nb-1k;
	Wed, 21 Dec 2022 02:37:37 +0000
Date: Wed, 21 Dec 2022 10:37:07 +0800
From: kernel test robot <lkp@intel.com>
To: Ronak Doshi <doshir@vmware.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH net ] vmxnet3: correctly report csum_level for
 encapsulated packet
Message-ID: <Y6JxUzQZJ5pV9GBc@416bcb91c936>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220202556.24421-1-doshir@vmware.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH net ] vmxnet3: correctly report csum_level for encapsulated packet
Link: https://lore.kernel.org/stable/20221220202556.24421-1-doshir%40vmware.com

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp



