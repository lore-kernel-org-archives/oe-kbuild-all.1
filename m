Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF9917BD6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Nov 2024 07:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731052138; cv=none; b=Fgg9S3VJMwvkxNOhFd6cY3rHnODf4aLgtA90rRQ8K3qDGWl6JCtuv4unKUJ73SLrorqFysrKMeHZUCI9UKRPX+dMPpR/1WAh4RaEG8GoAlrB1fsSgtSkzD50tady01K0NvYKnzSCzp63Pky/g7TjEE8QoMq2brmmtd4DpF5JK94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731052138; c=relaxed/simple;
	bh=5dmXCCV4iIz/N83stmlHFx3/ccn+n1/Omj/nysKWmw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t9ggHKwQtE5+ESXTL9o48eXMgSHmoDFpq3o+g6d8+SAIHR2zyWqo+t3qDc+iE7IaPHJvA2enPOwBX0XcmTLARADP6uCjsOBDudI+LupLDbznw38n985j5iL74t0McQcpDBYYY1Q1PCPF8zI9ehwf35D2Ds6tzNnWbliuqKYrUeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUF7koUR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUF7koUR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731052137; x=1762588137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5dmXCCV4iIz/N83stmlHFx3/ccn+n1/Omj/nysKWmw4=;
  b=nUF7koURiA32O4aYmPMPMQcUOQghRUz6/09Jo3zjSZ6sKira4VXwstgx
   MHYGKyOOEadFwuLYxyB2OeQ26oJHxVhudYma/mjxFQa4caYazAZIyuEUo
   l0QffKbaujMc7RxALfKEJMkjIV57J9XlwIfuFy9IFREqJDxzqTIPsXuug
   /8loF1EZROq409i/sAChQL0TLrqr/LtG9nLQ74kFTFWMyREERTYZ4UWyR
   1X67m8HBAxO/TEyYbu++vImn4XkliFIvVkFbC+M8NK2hN5aTylcvWRsxd
   Xhq0K8h4Z931NApVrVQlvYdY9gf5rLIHaNlqY1T5YuxrLWc7wtUDa81YN
   w==;
X-CSE-ConnectionGUID: ge023IIxSf2sZ+7QEZFJ9w==
X-CSE-MsgGUID: +6vEV1PmS4KpZLT2RAt3pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41484763"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41484763"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 23:48:56 -0800
X-CSE-ConnectionGUID: 88KURq/qRN+u3fJM/Z4oEw==
X-CSE-MsgGUID: ke0sPDvPTL2VBwGCW+N+TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,137,1728975600"; 
   d="scan'208";a="89393856"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Nov 2024 23:48:53 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9Jjf-000r9S-1t;
	Fri, 08 Nov 2024 07:48:51 +0000
Date: Fri, 8 Nov 2024 15:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	netdev <netdev@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kbuild@vger.kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>
Subject: Re: [PATCH net-next v3 3/9] lib: packing: add pack_fields() and
 unpack_fields()
Message-ID: <202411081548.EnYrguKQ-lkp@intel.com>
References: <20241107-packing-pack-fields-and-ice-implementation-v3-3-27c566ac2436@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-packing-pack-fields-and-ice-implementation-v3-3-27c566ac2436@intel.com>

Hi Jacob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a84e8c05f58305dfa808bc5465c5175c29d7c9b6]

url:    https://github.com/intel-lab-lkp/linux/commits/Jacob-Keller/lib-packing-create-__pack-and-__unpack-variants-without-error-checking/20241108-040154
base:   a84e8c05f58305dfa808bc5465c5175c29d7c9b6
patch link:    https://lore.kernel.org/r/20241107-packing-pack-fields-and-ice-implementation-v3-3-27c566ac2436%40intel.com
patch subject: [PATCH net-next v3 3/9] lib: packing: add pack_fields() and unpack_fields()
config: x86_64-randconfig-121-20241108 (https://download.01.org/0day-ci/archive/20241108/202411081548.EnYrguKQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241108/202411081548.EnYrguKQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411081548.EnYrguKQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/packing_test.c:412:1: sparse: sparse: symbol '__test_fields_buffer_sz' was not declared. Should it be static?
>> lib/packing_test.c:412:1: sparse: sparse: symbol 'test_fields' was not declared. Should it be static?

vim +/__test_fields_buffer_sz +412 lib/packing_test.c

   411	
 > 412	DECLARE_PACKED_FIELDS_S(test_fields, sizeof(packed_buf_t)) = {
   413		PACKED_FIELD(63, 61, struct test_data, field1),
   414		PACKED_FIELD(60, 52, struct test_data, field2),
   415		PACKED_FIELD(51, 28, struct test_data, field3),
   416		PACKED_FIELD(27, 14, struct test_data, field4),
   417		PACKED_FIELD(13, 9, struct test_data, field5),
   418		PACKED_FIELD(8, 0, struct test_data, field6),
   419	};
   420	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
