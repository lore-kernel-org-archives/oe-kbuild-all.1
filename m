Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDAB3C8C7F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 16:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778601966; cv=none; b=Y3ZqEg1i1A+i49RV0as9IPRmoag7acB91iTb8t3OLwD/v8IIUc5jQxbm0ymDrS8DXsovRbdywm1OiuF6ZlLU9HEQEmJFHE7sXDiHcqR1NZzHHk3t6mWG4oEsDNCzPTxcFz7W40QGpB9bwJh6Shi6dO/aoR3vv0VjTYWfoFwor4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778601966; c=relaxed/simple;
	bh=AyQ9xtOMb4IYdQeV3WW9btazhO6gl9JKhVLguyQtkKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GkzaDOLFiBwRGgceCwvNszFTBTlgyxl+CY5ppA8NIqCGQ3+ZF2k8IwTBEuraGOuFc3Jcj1xa2RaQzUClDDNegc0ZjPB4Vn14loNM11cBMX6Ngw0rmE8zJG5fYg/TV7muaeAK/eCZG5wXU9g8V2m+ewsSjvKZiu87RQO6ShCFJbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com; spf=pass smtp.mailfrom=linbit.com; dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b=iTyX1LEa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linbit-com.20251104.gappssmtp.com header.i=@linbit-com.20251104.gappssmtp.com header.b="iTyX1LEa"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b8bc6bc9so35958715e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 12 May 2026 09:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linbit-com.20251104.gappssmtp.com; s=20251104; t=1778601963; x=1779206763; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gta0G+bV80OABB/WN139/j6vYEcnqkRjYEQCiY9Dibo=;
        b=iTyX1LEalehxy66MDcm9VUdY6CMOjoG5p4ZvVE2dsdrMqKoiHf+BANU4IcDiBTDNc3
         bvzZTz9D5mQnlBQofZ+wg8Qjz1rU93mnNqiDNiduDcs12MC/C7q6vhypUsirmT6tuPje
         B6naTOHdogZS0TLZ3pQXcD8DsJnf3OusdQfp8wvTNxMBlVFEHoyj/a2rHJajabHwlQvV
         YwFROUrY2VWZyaJ+ZEQskK4PBlIIoDyJzZe7MuLoif0pI6rQL5MZCJcMt/908MKDTAkm
         G1A5covGxwV3aHinds88flVm1Oj/BQXMzsDY5n0d5J/YCVNLReU3+5zN68i9lVaD83k4
         HckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778601963; x=1779206763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gta0G+bV80OABB/WN139/j6vYEcnqkRjYEQCiY9Dibo=;
        b=puvAkoalO4OW07nSIOtwlDDE3IJIULzHDAHhzpv3vCGeFlRvbZ/9hbytEzL/W/l+y2
         YGa8QmuiWiX2qGKUyzswHtsbcLOUiA0Lyx8Okeu+eGQLdG+XH2EobQ4LHs+FbR9O11Nu
         zfo5ThxAnOgFJ7iQSW8qFUYWjpvzjL5G3DLMUQiH8XLgTzP+Ei953kZysmDOWUhGCmhS
         PX5ayW6xJwBk4UVx/g9hdqkNzPuEKoxH1aaFEuPV0jf1LktgLSjqKM9P1rVXAcx5ZqFv
         iparHYTbCUMa/kI980SvCNg9j5OmSgWpjlIUFdgz2t/I5hl7og89zKf7zWtyGbQIAFGQ
         gV7A==
X-Forwarded-Encrypted: i=1; AFNElJ/7Whqoft1E6XcyQ8Y+TX6JPdvm67Y81VFhnFv9hK0FlrmPbWMCyevr7S7W/ekPQ/U+htS/vNKoS5Xw6XuJ@lists.linux.dev
X-Gm-Message-State: AOJu0YydR5L0+DjDLfyjD9UNhCZxhvMRE+8z4fWCY2kzQNLinMgJPiLh
	U0wY42iawPtsYgXsZe7LomVTvnlaCZuaCKkpp0R5EBwg8leUOsEnAhUZ/w0QkBZdQUU=
X-Gm-Gg: Acq92OEmHBTIeQV6+Dyl1DE7JwWVIvXUyTz33uSBUFixF7aetb8FfwHzYhcfbPZB2qj
	Dqf62mLwhPYF967tXltjHoY+0P53TOVxvaaU7+75MPZJBunt/sUIKmcufF5pb5KJbJyQGjwaRQT
	NfeOMkbtuTpx5asZVaFcyhQ5X7kSuRvG/JZk9WtBu4DjGty227cGXMY6lUBsBEmvcA3uIahm/Er
	8IBv992TbRuZ/WfQMwB4FT99c8QKycmLcaKoEPqaVJdUir71ZC1yOCX0NVgNdxoCcUTcUFBzzRw
	UjXgYyc1CSXqEeNvoP4j6bqZ5TziRpyT4VrlY8pqy04elkzrQkRIqC6iV7s91SXx/EouWKG1xJ9
	ZBs1Yi19Dfo2FhSYU41Ow3Zgp+PUXydFLX+7GkbHA2kYophLPTh+Yz8eFu0JJ7+vyotoWqOsYVh
	8ROkNxEIA23hq2UD4uPpJXVwbyB0JGQr/HEnAwcgi9WWjJjKMuDj3a1dGdQigcIHVus8IDuOA7Q
	fthFQKcePXCi859
X-Received: by 2002:a05:600c:a01:b0:48e:706b:53e8 with SMTP id 5b1f17b1804b1-48e8fe569b7mr53894395e9.11.1778601962948;
        Tue, 12 May 2026 09:06:02 -0700 (PDT)
Received: from localhost (h082218028181.host.wavenet.at. [82.218.28.181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d2265asm6639165e9.8.2026.05.12.09.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:06:02 -0700 (PDT)
Date: Tue, 12 May 2026 18:06:01 +0200
From: Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Subject: Re: [axboe:for-7.2/block 1/2] ./usr/include/linux/drbd.h:18:10:
 fatal error: sys/types.h: No such file or directory
Message-ID: <agNP0KtOh856XAgZ@localhost.localdomain>
References: <202605101346.V2wwJqv1-lkp@intel.com>
 <d76cebb2-644c-472e-8b2d-af4f942bc900@kernel.dk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d76cebb2-644c-472e-8b2d-af4f942bc900@kernel.dk>

On Tue, May 12, 2026 at 09:26:11AM -0600, Jens Axboe wrote:
>On 5/10/26 12:03 AM, kernel test robot wrote:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-7.2/block
>> head:   8098eeb693c4cc4e774c62fbd4875197cb5578ce
>> commit: a54f499838292c1768f6575ed1ec7cf35f1b6489 [1/2] drbd: move UAPI headers to include/uapi/linux/
>> config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260510/202605101346.V2wwJqv1-lkp@intel.com/config)
>> compiler: nios2-linux-gcc (GCC) 11.5.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605101346.V2wwJqv1-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202605101346.V2wwJqv1-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>    In file included from <command-line>:
>>>> ./usr/include/linux/drbd.h:18:10: fatal error: sys/types.h: No such file or directory
>>       18 | #include <sys/types.h>
>>          |          ^~~~~~~~~~~~~
>>    compilation terminated.
>
>Christian, are you fixing these? I keep getting emails about this
>one and the one in patch 2 as well...
>
>-- 
>Jens Axboe
>

Yeah sorry, on it. Patch coming in the next few days.
