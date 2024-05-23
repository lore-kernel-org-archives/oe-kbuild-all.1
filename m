Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36D039AF9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 05:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716442525; cv=none; b=iXgLCykN8ENMsy7opZbFVyaz6UJG9P0wMWcmndzjFZHfz+3XNXnrD4tansEoniDRhwLUEwfUGTVSAYJ/9G2d5XFmSqFwWayf+1VHNS5QfY1C8k7IBzJKWlHNger3ZebiB6KOUYtQ94oNjk5RCxJhNfO8ufdM+CYPVUrrQFtvJA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716442525; c=relaxed/simple;
	bh=9MSePypnN2x7tkFIRXGJk1Lfzb+uoHj4i2u0JdsvilY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=nUhUDPyPquDMBD4nIhOIf5dN2Gz+P0rXgtFxwGBG6tdvRkW/dbmhTQzIQ3HYePEwzQVS0cJo3K8L27Np2+e2K5bvGo3hMtLqJUKLCvcRwSyUnyq+YKSQB8WqVEzmhbPxmJL6uIn4tPuG4WnfVysZ0OuAIbDxLkd6LwRAAJwOieM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SIvdscyF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SIvdscyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716442522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NkVYYwuuRqZJhdNUMtbXmkO5vXRSiVRryfoV8WYL+q0=;
	b=SIvdscyFaILxGXEyuu1JCY7UOqHNzhieo51A2/FSTa/VmrLxDwHYh3axwa/ctdaRxOOfif
	ygnelhKvd+v+FRDBRNTZj5xILZVbDBceBaVsinhCjwmH7CsJsUM8E4+mfFXefAten1nKV6
	gGuF8tXluqUAIdXF86w0sIIekhEgOXQ=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-r_43QCReMOa6QcpI3Sol3w-1; Thu, 23 May 2024 01:35:18 -0400
X-MC-Unique: r_43QCReMOa6QcpI3Sol3w-1
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3c9a9449072so951222b6e.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 22 May 2024 22:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716442518; x=1717047318;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkVYYwuuRqZJhdNUMtbXmkO5vXRSiVRryfoV8WYL+q0=;
        b=IOQhpa39WiLV+2SM6zR36wcfW97XXTxtDFU8ekVrpFORPsILYKB/oILq8yBpVPOO1A
         Ust17WP7SHkeXGchnUNAZIErT5J16QiqIHO4eV6e+dsCOUuecoSV/rBp7D/sbfk8y9JS
         bju1PX89F9I+p8FuGo6AKAf2QN3zvjKsK0QY50UooTLQUiubTWi5jvHGy+bPutuV+oOF
         91AFxeGHA8O/3UjSejSLkESBNGurPXKY0goM9kogF91USN1/SBmIn6Cl9D5hBO7qldzX
         3c+CbrdQOHa3840KF+oOJpSV6citFWZEhKgQypDZ6BWiUEHjGiWi7u8SpwPlyDy21Mf4
         qKZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXc/tB5iQqxW6TLaeWE4EYXHP/omFU5n4ujK6QJTb0EBqjWzE8pv/fu/CMG9aFQiY7kUf7VC/u7sSvwsKmkQfd85vhlSQMLJzxdyivBsw==
X-Gm-Message-State: AOJu0Ywze1F2Jn5H6355HravyTUoBtN2hIDJqlfTcABfguS5x5GRraf/
	YYy4Ag2a6L3Ev2e+8IbFN6dhraorzhObnOjiU4QqN3j7Fpr3CodvRCuozCG+BCzowLftMTsLD8W
	FWLSH5Wct4GVc5R8820oV3MvP+Ot6odAg1jgYiAhD1So7V9pehS3NEIqnIGEltKs=
X-Received: by 2002:a05:6808:1cf:b0:3c9:924c:8304 with SMTP id 5614622812f47-3cdabd20d70mr3851744b6e.0.1716442517752;
        Wed, 22 May 2024 22:35:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU9TCM4OePsLNJcyJGxLImpn1NPmzuyatA+WiPDO4CMkcIyNbE/3eCPkgw29C+PBMkQ6fM4w==
X-Received: by 2002:a05:6808:1cf:b0:3c9:924c:8304 with SMTP id 5614622812f47-3cdabd20d70mr3851705b6e.0.1716442516284;
        Wed, 22 May 2024 22:35:16 -0700 (PDT)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2b2d767sm23300983b3a.186.2024.05.22.22.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 22:35:15 -0700 (PDT)
Date: Thu, 23 May 2024 13:34:23 +0800
From: Coiby Xu <coxu@redhat.com>
To: Baoquan He <bhe@redhat.com>, kernel test robot <lkp@intel.com>
Cc: kexec@lists.infradead.org, oe-kbuild-all@lists.linux.dev, 
	Ondrej Kozina <okozina@redhat.com>, Milan Broz <gmazyland@gmail.com>, 
	Thomas Staudt <tstaudt@de.ibm.com>, Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Jan Pazdziora <jpazdziora@redhat.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Dave Young <dyoung@redhat.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Kees Cook <keescook@chromium.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	"(open list:KERNEL HARDENING (not covered by other areas):Keyword:b__counted_byb)" <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH v3 2/7] crash_dump: make dm crypt keys persist for the
 kdump kernel
Message-ID: <xnsvk5wlfuxomr3aayz6essyzgofux5orj366cizh5525ygbbx@tpdunjmf53m7>
References: <20240425100434.198925-3-coxu@redhat.com>
 <202404262003.qsWvGwZU-lkp@intel.com>
 <ZkwSEUEW/RKFLubx@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZkwSEUEW/RKFLubx@MiWiFi-R3L-srv>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 21, 2024 at 11:20:35AM +0800, Baoquan He wrote:
>On 04/26/24 at 09:10pm, kernel test robot wrote:
>> Hi Coiby,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on linus/master]
>> [also build test WARNING on v6.9-rc5 next-20240426]
>> [cannot apply to tip/x86/core]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/kexec_file-allow-to-place-kexec_buf-randomly/20240425-180836
>> base:   linus/master
>> patch link:    https://lore.kernel.org/r/20240425100434.198925-3-coxu%40redhat.com
>> patch subject: [PATCH v3 2/7] crash_dump: make dm crypt keys persist for the kdump kernel
>> config: x86_64-randconfig-r113-20240426 (https://download.01.org/0day-ci/archive/20240426/202404262003.qsWvGwZU-lkp@intel.com/config)
>> compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240426/202404262003.qsWvGwZU-lkp@intel.com/reproduce)
>
>
>Please respond to the lkp report in time whether it's a problem or not,
>otherwise the link will be unavailable.

Thanks for the reminder! I've fixed the reported problem in v4.

>
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202404262003.qsWvGwZU-lkp@intel.com/
>>
>> sparse warnings: (new ones prefixed by >>)
>> >> kernel/crash_dump_dm_crypt.c:31:3: sparse: sparse: symbol 'keys_header' was not declared. Should it be static?

Yes, symbol 'keys_header' should be static! Thanks for the report!

>>
>> vim +/keys_header +31 kernel/crash_dump_dm_crypt.c
>>
>>     27	
>>     28	struct keys_header {
>>     29		unsigned int key_count;
>>     30		struct dm_crypt_key keys[] __counted_by(key_count);
>>   > 31	} *keys_header;
>>     32	
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
>>
>

-- 
Best regards,
Coiby

