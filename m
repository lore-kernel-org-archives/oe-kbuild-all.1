Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB9A311946
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 18:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763059018; cv=none; b=KoiWYh8/9J/FLnxQIB+uGGmueNRR+fZwvJt0L5bTNJT5QC3VGiEIjXuPX2rUf4Vjnms/VkH8O9TsuLsU7HzCQ21K3+rjdSRWZ43hegDSzlRGoLANm2cz3hMR7EkTB9JpU4C9JbbAyRqrEaHCKztd2u8ZZgR84fzYtM9f17k53Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763059018; c=relaxed/simple;
	bh=+lUZbBPlqyDZV10fRHSEKd0/IEZTPweBnTLZS8fvvUE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=mwjG1atd4u9behuDvft20tRy5wD9G8EJOJF3wgwiHtB1+VXc+hSw8GE8SO701xTNf+sK83M0SVNibJmM1QKbumB0TSV3nx/Qezx+YcWTrfAZo58ObM3IHZBjLUhFNfLJyAHA9PSbwLpbwQUo7KZVv1uyJegUNMXH0LWDu0coP9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BUMIXJx4; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BUMIXJx4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763059016; x=1794595016;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=+lUZbBPlqyDZV10fRHSEKd0/IEZTPweBnTLZS8fvvUE=;
  b=BUMIXJx4SJKmqyejORFSHoJ6hWvlgRI0uszis6qsINycbIkeZ7fTnZnk
   dHdx+Jk1AS/H1qOgcdh7JGDlkyBgevq0uPAj9Gg+qLg63tmxsDKUlfYkp
   x96V+QQbGDZBrtoj2damyMKeJhAIGcT2VVrg7GHzrUiKmMlTXkr0v2KUd
   /G9L4TcGyq7sWFvq5R6zYnVpdsyx7K3E01HhhSxGZi5Re15x+gZpS90at
   k6YxfABYHqzAjipzVU3UzAAvZ5qyAwhuUAOfQpEVN7gGQXNjkXeK75+s0
   8xBsuYaR+Rbh/nrSyOaq0fpbFMI2A+m8+Xn1xbUQmC7NN5DnEQ3m6saIV
   g==;
X-CSE-ConnectionGUID: SB94bxxlRsi0ZNYDQNQdBg==
X-CSE-MsgGUID: Y2IXdG8kTIKoxntHT2luMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="64353610"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="64353610"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 10:36:53 -0800
X-CSE-ConnectionGUID: T5z/fcIwRjOzgl8QD4GehQ==
X-CSE-MsgGUID: BDVUKdb/SeCRHfvs1NyaPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; 
   d="scan'208";a="189767274"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Nov 2025 10:36:51 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJcBd-0005kh-1u;
	Thu, 13 Nov 2025 18:36:49 +0000
Date: Fri, 14 Nov 2025 02:36:26 +0800
From: kernel test robot <lkp@intel.com>
To: Farhan Ali <alifm@linux.ibm.com>
Cc: stable@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 3/9] PCI: Avoid saving error values for config space
Message-ID: <aRYlKgnAzJvZHESe@c83b8aa73612>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113183502.2388-4-alifm@linux.ibm.com>

Hi,

Thanks for your patch.

FYI: kernel test robot notices the stable kernel rule is not satisfied.

The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html#option-1

Rule: add the tag "Cc: stable@vger.kernel.org" in the sign-off area to have the patch automatically included in the stable tree.
Subject: [PATCH v5 3/9] PCI: Avoid saving error values for config space
Link: https://lore.kernel.org/stable/20251113183502.2388-4-alifm%40linux.ibm.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



