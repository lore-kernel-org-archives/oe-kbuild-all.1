Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E511D3652
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Aug 2024 23:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724800465; cv=none; b=RJ4QtGw96SbnKr57C5lFtyc1hhG65uzTY42KQfHQJ1HRjaaqIiYob9P2C7dEzN6EvtXHQHMMHsLkFrmcmKGBss5XoFQYjOrsndfGfJ+na6etUe8twKszakki46xf9N5IEQzZ2WBpuk5jw9At1Z7N9GN+/+4TmHUHs0BMF7y0Edg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724800465; c=relaxed/simple;
	bh=d2xw+MKXUlAGJzl40PtsI6mqCR3vfnryuHkt2MNP7GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dGqfVct9A3KuZaczcoihvaLbx0SYtkbsf1C/dKj7aJc+QJY5vCxqJVGTIcLcKlQ/4Tbw8k/2WsAzH2+HapJiaNxpGpiSClbOVlnu4EQVJH5nIryjfWJY1xtZWMzcs0CXIjUC2jVAORLrxwoDFV2or5I40H0meBt9DCkENHI20aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOlYz5rw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOlYz5rw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724800463; x=1756336463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d2xw+MKXUlAGJzl40PtsI6mqCR3vfnryuHkt2MNP7GA=;
  b=WOlYz5rw844l6q5kRTsQKzMl9myyJ9k8ZwagsdN1YNkhARwJwNgvov/u
   zMsfRg8DljQkBMLfyMvhCMnDdfIcw34AN1g7Hx7Iy4XixbcUG1Gw8fg1d
   ubfbS/87i2OlzIt6snSmlyISRoAnhSCIjtZZwYDE1XF2Yqm71JxfjkNDb
   VZ4FJtE0eZzBvOJKluFxlmUpGlNd7opxEbCcBrN1NNVUus7RPCsu3iSQ8
   /yDBx9Kxfd3OdbawhsCLgAXpDY/jn8tDVlQPjBD+BuVaButxdvuXINpKB
   c8QJEuujzjkN8n0t/iP7XsWxLuu93iCVw5D7zJMmIzJ4MHjT+DO4mwZLf
   Q==;
X-CSE-ConnectionGUID: DWlgQ/lDTYm6JKxZYzDwDg==
X-CSE-MsgGUID: xms77mmGRGGK+WsJ5FBQ3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="48690597"
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="48690597"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 16:14:22 -0700
X-CSE-ConnectionGUID: JqZ9HEmVTpW9X6PGADDbEQ==
X-CSE-MsgGUID: /CvRBK0mS7+/DPOk8F0C8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,181,1719903600"; 
   d="scan'208";a="63541487"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Aug 2024 16:14:21 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sj5OE-000KB8-16;
	Tue, 27 Aug 2024 23:14:18 +0000
Date: Wed, 28 Aug 2024 07:13:57 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Johnston <matt@codeconstruct.com.au>, jk@codeconstruct.com.au
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
	netdev@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: mctp-serial: Add kunit test for
 next_chunk_len()
Message-ID: <202408280734.ioysUDjL-lkp@intel.com>
References: <20240827020803.957250-2-matt@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240827020803.957250-2-matt@codeconstruct.com.au>

Hi Matt,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Matt-Johnston/net-mctp-serial-Add-kunit-test-for-next_chunk_len/20240827-101656
base:   net/main
patch link:    https://lore.kernel.org/r/20240827020803.957250-2-matt%40codeconstruct.com.au
patch subject: [PATCH net 1/2] net: mctp-serial: Add kunit test for next_chunk_len()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240828/202408280734.ioysUDjL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408280734.ioysUDjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408280734.ioysUDjL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/mctp/mctp-serial.c: In function 'test_next_chunk_len':
>> drivers/net/mctp/mctp-serial.c:541:40: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     541 |         struct test_chunk_tx *params = test->param_value;
         |                                        ^~~~


vim +/const +541 drivers/net/mctp/mctp-serial.c

   534	
   535	static void test_next_chunk_len(struct kunit *test)
   536	{
   537		struct mctp_serial devx;
   538		struct mctp_serial *dev = &devx;
   539		int next;
   540	
 > 541		struct test_chunk_tx *params = test->param_value;
   542	
   543		memset(dev, 0x0, sizeof(*dev));
   544		memcpy(dev->txbuf, params->input, params->input_len);
   545		dev->txlen = params->input_len;
   546	
   547		for (size_t i = 0; i < MAX_CHUNKS; i++) {
   548			next = next_chunk_len(dev);
   549			dev->txpos += next;
   550			KUNIT_EXPECT_EQ(test, next, params->chunks[i]);
   551	
   552			if (next == 0) {
   553				KUNIT_EXPECT_EQ(test, dev->txpos, dev->txlen);
   554				return;
   555			}
   556		}
   557	
   558		KUNIT_FAIL_AND_ABORT(test, "Ran out of chunks");
   559	}
   560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
