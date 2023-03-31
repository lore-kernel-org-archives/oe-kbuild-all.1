Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AED1256F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Mar 2023 11:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680262777; x=1711798777;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=A2WCIv0h0Li4tUFo4QJWBvEpuFk/Geg5LR36AGQ94lo=;
  b=L010mp8hr0RWlGCWn5GLW6xYwrdyrKht55gX3wbNixmQHimY31wmIaf1
   fZLZb/TiIRaWwDblEBtbVoBDZBUcb9W/YjOMlW3nFrDJtmGtVQ6DGJtl+
   gsVfrxs8tHgXUCz7SzLxmCQt/c61kvtwJPdjYOdsIedVJvMDX2H9+yZ7E
   q+ZMK+xO98SCp6CRSxjcU4OXdig0R42j41nR+gSyoZXFHd/x077JzLMrG
   OVoMNvxae+8HlazlUBXf8UpfS/WLIkhkbkh4uuzl96dRYUHpIbput2b4r
   p6ID9sHoTZranyWpo5BuJf8/yHzcy64FvQoUmhDKmsvQ8goDHcHia1WJU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427710262"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="427710262"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2023 04:39:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="662389713"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; 
   d="scan'208";a="662389713"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 31 Mar 2023 04:39:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1piD6T-000Lja-31;
	Fri, 31 Mar 2023 11:39:33 +0000
Date: Fri, 31 Mar 2023 19:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jianmin Lv <lvjianmin@loongson.cn>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V2 3/5] irqchip/loongson-eiointc: Fix registration of
 syscore_ops
Message-ID: <ZCbGdDxFyQo2jweI@ec83ac1404bb>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230331113900.9105-4-lvjianmin@loongson.cn>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
Subject: [PATCH V2 3/5] irqchip/loongson-eiointc: Fix registration of syscore_ops
Link: https://lore.kernel.org/stable/20230331113900.9105-4-lvjianmin%40loongson.cn

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests



