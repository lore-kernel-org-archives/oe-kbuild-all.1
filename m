Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2588518E20
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 08:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726475789; cv=none; b=AK1hmAdtz1wD7l9hkaQMaavjrDkJlTbXxeRqfH1XOd5KPENjFycpmWc6isoQ0NTikFLxnX6fK50ROa0r/4rMUkYVUTfsalzKl6U1LqMKnb/aV/N+SVjCHJNlUjz/cxVBKw5wMTqX6NOUAD5FyLw0C8Y1E2gF6D5Q99h2WAcRPNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726475789; c=relaxed/simple;
	bh=ExwIcThVvO+7ZAUVFxCZRYWIdFsONsYB9CaICjRnUgU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=COERBqtV6olwq9CywRtdLCk2PMKBI9GJL5xXlqZ6nF39fvi/JIYojxu0/csVBRcEGByI/zqjec+Isfs2Fuk+UTeSkRI7vB1ic1jPEu4Lu6a9ddHGlMfzY/zFtwqQFrpVgAJS1azwwu6gBSXJClBMHbN1sbtuNDBp+/O/g2Kbbvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xz4OHicY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xz4OHicY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726475786;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SZghuNl8RSxhnXryd0EQnOpNodf1ePXadDKLScPEidI=;
	b=Xz4OHicYetMR0XuOwvwxsaRFx2F4xM6ynnukJWYqbxj0pA0NKZreD4uiZEIcY33io8jpvp
	PR2a1vrmnhmNgK/cVnTTTUW8FEb4tWJso4Yww6CsdlRqy2plU5xi23L3f4RG2sCKjYP18X
	Yrk6VjTgSljWs7eS28zbBnY/vOsHEls=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-2GoeiYhOMfCwgRjhAlY5eQ-1; Mon, 16 Sep 2024 04:36:24 -0400
X-MC-Unique: 2GoeiYhOMfCwgRjhAlY5eQ-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3787ea79dceso1020898f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 01:36:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726475784; x=1727080584;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZghuNl8RSxhnXryd0EQnOpNodf1ePXadDKLScPEidI=;
        b=HTNm5RON1CV7kc34ygjTu6pUnPXj+UsCKhwaQG53vYqhC9TLfp0XhM54PNGPCLKxa7
         Q1NspS0MFT4lh+3dC/Q0hPnL7OD2gQ/uEs2qakqs2LaY9Z7GHgb2pCOCYrHursaqi9LA
         rCNLBOXkQMzG7cUguqYZ3h2wg3QtKC8jaHeothWtatOQy99n+iU4V8rUHIqBrQNiqwW7
         xTpluz/hynUxRqtp2iDL58hUk8zdDwqiU+4FHQOo02qEiVIENGafVshV5b+O2PV4Mnhb
         0R1V2cMQgbA0kYiPPInbmtOyvnnlrV+n63fBuuivCvIY9CxiF45MmfzNmtQEO0Dt2fJt
         pPuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2qce9ope2vm66y8BkbVrm0KvZrRLTon1OImw9EFS1L+frcf3YWOinSj8yR/ORvHxYlj1cqdADS3sg1rVz@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ58g36k4se3Rv5S9ZbrfHvWIcdPz/Bqh2kqc/wlzQFXwo3gMx
	NqXdfTqBAHrzkUssKnhUh25DFmP5dZz5DxbuaWzQRQV+jAJzsudUtSRf1utc06lBZ8sW/rbyT7v
	IrL0v66Z7C9DajRJRxW4ygMrVjZl8xlFxKpeb0hI1QT8qSy0DDEOMdAEQqQuxZmE=
X-Received: by 2002:adf:facb:0:b0:374:babf:ac4d with SMTP id ffacd0b85a97d-378d625360bmr4960088f8f.58.1726475783578;
        Mon, 16 Sep 2024 01:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeUS2MF6BwNmrHrtyITHuRjTmMKPOYmdWcd0GIjcbKqPN/sItyo4uvsPMndSeuH50X7fkZOA==
X-Received: by 2002:adf:facb:0:b0:374:babf:ac4d with SMTP id ffacd0b85a97d-378d625360bmr4960068f8f.58.1726475783006;
        Mon, 16 Sep 2024 01:36:23 -0700 (PDT)
Received: from localhost (red-hat-inc.vlan560.asr1.mad1.gblx.net. [159.63.51.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e72e49d5sm6620646f8f.17.2024.09.16.01.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:36:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, kernel test robot
 <lkp@intel.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, Julius Werner
 <jwerner@chromium.org>, Hugues Bruant <hugues.bruant@gmail.com>,
 intel-gfx@lists.freedesktop.org, Brian Norris <briannorris@chromium.org>,
 dri-devel@lists.freedesktop.org, Borislav Petkov <bp@alien8.de>,
 chrome-platform@lists.linux.dev, Tzung-Bi Shih <tzungbi@kernel.org>
Subject: Re: [PATCH v3] firmware: coreboot: Don't register a pdev if
 screen_info data is present
In-Reply-To: <eeac1c3c-4a21-4cd5-b513-8e55cffe0bae@suse.de>
References: <20240913213246.1549213-1-javierm@redhat.com>
 <202409151528.CIWZRPBq-lkp@intel.com>
 <eeac1c3c-4a21-4cd5-b513-8e55cffe0bae@suse.de>
Date: Mon, 16 Sep 2024 10:36:21 +0200
Message-ID: <8734m0atbu.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas and Tzung-Bi,

> Hi
>
> Am 15.09.24 um 09:44 schrieb kernel test robot:
>> Hi Javier,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on chrome-platform/for-next]
>> [also build test ERROR on chrome-platform/for-firmware-next linus/master v6.11-rc7 next-20240913]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Martinez-Canillas/firmware-coreboot-Don-t-register-a-pdev-if-screen_info-data-is-present/20240914-053323
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next
>> patch link:    https://lore.kernel.org/r/20240913213246.1549213-1-javierm%40redhat.com
>> patch subject: [PATCH v3] firmware: coreboot: Don't register a pdev if screen_info data is present
>> config: riscv-randconfig-001-20240915 (https://download.01.org/0day-ci/archive/20240915/202409151528.CIWZRPBq-lkp@intel.com/config)
>> compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240915/202409151528.CIWZRPBq-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202409151528.CIWZRPBq-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>>> ld.lld: error: undefined symbol: screen_info
>>     >>> referenced by framebuffer-coreboot.c:27 (drivers/firmware/google/framebuffer-coreboot.c:27)
>>     >>>               drivers/firmware/google/framebuffer-coreboot.o:(framebuffer_probe) in archive vmlinux.a
>>     >>> referenced by framebuffer-coreboot.c:27 (drivers/firmware/google/framebuffer-coreboot.c:27)
>>     >>>               drivers/firmware/google/framebuffer-coreboot.o:(framebuffer_probe) in archive vmlinux.a
>
> Not all platforms define screen_info. Maybe fix this by following

Yes, after reading the build errors reported by the robot I remembered
that we had similar issues with sysfb, for example commit 1260b9a7020
("drivers/firmware: fix SYSFB depends to prevent build failures") fixed
one of those.

> Tzung-Bi's advice of removing the local variables and then guard the
> test by CONFIG_SYSFB. If SYSFB has been defined, screen_info has to be 
> there. It's not a super pretty solution, though.
>

If possible I would prefer to avoid the ifdefery in the driver. I also
believe that the local variables makes the code easier to read. But if
you folks think that's better to drop them, I can do it in the next rev.

Another option is to restrict the architectures where this driver could
be build. As far as I understand it is mainly for x86 and ARM64 arches.

These two have a screen_info defined so the driver will build correctly.
I can include a preparatory patch that adds a "depends on x86 || ARM64".

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

