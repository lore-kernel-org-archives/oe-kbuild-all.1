Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FC979DC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 May 2024 02:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716173434; cv=none; b=EHdpGgknC3zcnHOuoBbXmGMRmlhdsk/xNWTQGDe4TGs32TosmFK2074zXNTyhaZOUecRGoyzZcRQaYniZ9oevJh3gmHSFdOb2YgQHT6N+1G6/yxDnC00z4kUw2Kv4xqEI1GctojOXglzy6xkTXqIZRDp6+6s9hv+jSdO0AdtYy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716173434; c=relaxed/simple;
	bh=0dTHr3WcSyVIyIvqeAdZtwbW64oVuGGJp+5m75sOK8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q7tviBkk+G+zaMRDu1y19NmHN3n9WETVYxLmKHQte9mS1DqZVAr2rrrN3Huw7HnheHoYhMzVSZCp5qBGkXWPkmwdqrjXxJZIpILhlodVtfqeehUOWV0EMDEJ+IN7qrGLGqjiSLvfuoY4Ucrt7gpRBWgEkutU8UyuET8Gq6WM4kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mnvvhBPV; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mnvvhBPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716173430; x=1747709430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0dTHr3WcSyVIyIvqeAdZtwbW64oVuGGJp+5m75sOK8I=;
  b=mnvvhBPVtK1mc5NdlcMtDC/2woeafzbU2bZMNlmuIalwvsD9UNTRBPym
   GGL9Us9GJ39BYyd/XSh1eNQ9Dk9+zBXanYHwY/PwIeKDh1l1CdF0emJSw
   c5fS9545xyJDl8gMA2K5BMgS5nfEAJohWbiRh2WH0jNaNgE0UvBo3CaRL
   poL+1Dk2+BrDFTmQ2TmfXaxFcA49UHauJjnF0axc0/nJBVz3Kkvr7du9T
   c8Uh+LgF5Q7PUtO5MyCXI8ZMHT54YtQ9asr9SNJjnBeNWLatOfkTcPJG5
   IPuMMDg7tfgzSx+xhtVYQQFLQelBRQxZfoNCS1nI4xnzq8SXl3XlS9NHx
   Q==;
X-CSE-ConnectionGUID: r9QUe/s3R/6s8MyWPMYTzw==
X-CSE-MsgGUID: vLkiq3gyRzal4pyy6Mq5kQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12126031"
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="12126031"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 19:50:29 -0700
X-CSE-ConnectionGUID: N0sVl1e7S56/qCuM3NnqEA==
X-CSE-MsgGUID: /JJH3fsrR8+rK7VP5gBczQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,174,1712646000"; 
   d="scan'208";a="32403721"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 19 May 2024 19:50:28 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8t6X-0004X4-1t;
	Mon, 20 May 2024 02:50:25 +0000
Date: Mon, 20 May 2024 10:20:06 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2_key-2 6/9] lib/asn1_encoder.c:33:26: warning:
 ordered comparison of pointer with integer zero
Message-ID: <202405201048.xfmhnFyQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2_key-2
head:   67d9eefe3abe5992a49e9f749f57e18d49ce921f
commit: 8dc218fbd94b5a7bd4ca292c2379e13fc967b665 [6/9] lib: Expand asn1_encode_integer() to variable size integers
config: x86_64-buildonly-randconfig-002-20240520 (https://download.01.org/0day-ci/archive/20240520/202405201048.xfmhnFyQ-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240520/202405201048.xfmhnFyQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405201048.xfmhnFyQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/asn1_encoder.h:9,
                    from lib/asn1_encoder.c:8:
   lib/asn1_encoder.c: In function 'asn1_encode_integer':
>> lib/asn1_encoder.c:33:26: warning: ordered comparison of pointer with integer zero [-Wextra]
      33 |         if (WARN(integer < 0,
         |                          ^
   include/asm-generic/bug.h:132:32: note: in definition of macro 'WARN'
     132 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~


vim +33 lib/asn1_encoder.c

b07067627cd5f1 James Bottomley 2021-01-27  12  
b07067627cd5f1 James Bottomley 2021-01-27  13  /**
b07067627cd5f1 James Bottomley 2021-01-27  14   * asn1_encode_integer() - encode positive integer to ASN.1
b07067627cd5f1 James Bottomley 2021-01-27  15   * @data:		pointer to the pointer to the data
b07067627cd5f1 James Bottomley 2021-01-27  16   * @end_data:		end of data pointer, points one beyond last usable byte in @data
b07067627cd5f1 James Bottomley 2021-01-27  17   * @integer:		integer to be encoded
8dc218fbd94b5a Jarkko Sakkinen 2024-05-20  18   * @integer_len:	length in bytes of the integer blob
b07067627cd5f1 James Bottomley 2021-01-27  19   *
b07067627cd5f1 James Bottomley 2021-01-27  20   * This is a simplified encoder: it only currently does
b07067627cd5f1 James Bottomley 2021-01-27  21   * positive integers, but it should be simple enough to add the
b07067627cd5f1 James Bottomley 2021-01-27  22   * negative case if a use comes along.
b07067627cd5f1 James Bottomley 2021-01-27  23   */
b07067627cd5f1 James Bottomley 2021-01-27  24  unsigned char *
b07067627cd5f1 James Bottomley 2021-01-27  25  asn1_encode_integer(unsigned char *data, const unsigned char *end_data,
8dc218fbd94b5a Jarkko Sakkinen 2024-05-20  26  		    const u8 *integer, u8 integer_len)
b07067627cd5f1 James Bottomley 2021-01-27  27  {
b07067627cd5f1 James Bottomley 2021-01-27  28  	int data_len = end_data - data;
b07067627cd5f1 James Bottomley 2021-01-27  29  	unsigned char *d = &data[2];
b07067627cd5f1 James Bottomley 2021-01-27  30  	bool found = false;
b07067627cd5f1 James Bottomley 2021-01-27  31  	int i;
b07067627cd5f1 James Bottomley 2021-01-27  32  
b07067627cd5f1 James Bottomley 2021-01-27 @33  	if (WARN(integer < 0,
b07067627cd5f1 James Bottomley 2021-01-27  34  		 "BUG: integer encode only supports positive integers"))
b07067627cd5f1 James Bottomley 2021-01-27  35  		return ERR_PTR(-EINVAL);
b07067627cd5f1 James Bottomley 2021-01-27  36  
b07067627cd5f1 James Bottomley 2021-01-27  37  	if (IS_ERR(data))
b07067627cd5f1 James Bottomley 2021-01-27  38  		return data;
b07067627cd5f1 James Bottomley 2021-01-27  39  
b07067627cd5f1 James Bottomley 2021-01-27  40  	/* need at least 3 bytes for tag, length and integer encoding */
b07067627cd5f1 James Bottomley 2021-01-27  41  	if (data_len < 3)
b07067627cd5f1 James Bottomley 2021-01-27  42  		return ERR_PTR(-EINVAL);
b07067627cd5f1 James Bottomley 2021-01-27  43  
b07067627cd5f1 James Bottomley 2021-01-27  44  	/* remaining length where at d (the start of the integer encoding) */
b07067627cd5f1 James Bottomley 2021-01-27  45  	data_len -= 2;
b07067627cd5f1 James Bottomley 2021-01-27  46  
b07067627cd5f1 James Bottomley 2021-01-27  47  	data[0] = _tag(UNIV, PRIM, INT);
b07067627cd5f1 James Bottomley 2021-01-27  48  	if (integer == 0) {
b07067627cd5f1 James Bottomley 2021-01-27  49  		*d++ = 0;
b07067627cd5f1 James Bottomley 2021-01-27  50  		goto out;
b07067627cd5f1 James Bottomley 2021-01-27  51  	}
b07067627cd5f1 James Bottomley 2021-01-27  52  
8dc218fbd94b5a Jarkko Sakkinen 2024-05-20  53  	for (i = 0; i < integer_len; i++) {
8dc218fbd94b5a Jarkko Sakkinen 2024-05-20  54  		int byte = integer[i];
b07067627cd5f1 James Bottomley 2021-01-27  55  
b07067627cd5f1 James Bottomley 2021-01-27  56  		if (!found && byte == 0)
b07067627cd5f1 James Bottomley 2021-01-27  57  			continue;
b07067627cd5f1 James Bottomley 2021-01-27  58  
b07067627cd5f1 James Bottomley 2021-01-27  59  		/*
b07067627cd5f1 James Bottomley 2021-01-27  60  		 * for a positive number the first byte must have bit
b07067627cd5f1 James Bottomley 2021-01-27  61  		 * 7 clear in two's complement (otherwise it's a
b07067627cd5f1 James Bottomley 2021-01-27  62  		 * negative number) so prepend a leading zero if
b07067627cd5f1 James Bottomley 2021-01-27  63  		 * that's not the case
b07067627cd5f1 James Bottomley 2021-01-27  64  		 */
b07067627cd5f1 James Bottomley 2021-01-27  65  		if (!found && (byte & 0x80)) {
b07067627cd5f1 James Bottomley 2021-01-27  66  			/*
b07067627cd5f1 James Bottomley 2021-01-27  67  			 * no check needed here, we already know we
b07067627cd5f1 James Bottomley 2021-01-27  68  			 * have len >= 1
b07067627cd5f1 James Bottomley 2021-01-27  69  			 */
b07067627cd5f1 James Bottomley 2021-01-27  70  			*d++ = 0;
b07067627cd5f1 James Bottomley 2021-01-27  71  			data_len--;
b07067627cd5f1 James Bottomley 2021-01-27  72  		}
b07067627cd5f1 James Bottomley 2021-01-27  73  
b07067627cd5f1 James Bottomley 2021-01-27  74  		found = true;
b07067627cd5f1 James Bottomley 2021-01-27  75  		if (data_len == 0)
b07067627cd5f1 James Bottomley 2021-01-27  76  			return ERR_PTR(-EINVAL);
b07067627cd5f1 James Bottomley 2021-01-27  77  
b07067627cd5f1 James Bottomley 2021-01-27  78  		*d++ = byte;
b07067627cd5f1 James Bottomley 2021-01-27  79  		data_len--;
b07067627cd5f1 James Bottomley 2021-01-27  80  	}
b07067627cd5f1 James Bottomley 2021-01-27  81  
b07067627cd5f1 James Bottomley 2021-01-27  82   out:
b07067627cd5f1 James Bottomley 2021-01-27  83  	data[1] = d - data - 2;
b07067627cd5f1 James Bottomley 2021-01-27  84  
b07067627cd5f1 James Bottomley 2021-01-27  85  	return d;
b07067627cd5f1 James Bottomley 2021-01-27  86  }
b07067627cd5f1 James Bottomley 2021-01-27  87  EXPORT_SYMBOL_GPL(asn1_encode_integer);
b07067627cd5f1 James Bottomley 2021-01-27  88  

:::::: The code at line 33 was first introduced by commit
:::::: b07067627cd5f1f6dc60c224b47c728f7f4b7b45 lib: Add ASN.1 encoder

:::::: TO: James Bottomley <James.Bottomley@HansenPartnership.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
