Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5685C194080
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 12:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717763287; cv=none; b=KP19Z45uhf1yMIqDffQCLO3RWc4wH31OHDO3AtWNrAp5iN7dHKFeu9dCVGZAkpe7mqMIZnXBSIhSbt8kXk9JnRluoJXW7mpnj3jLH/2JxjmwSc+zAR9UCnBsItaLiHSBsHpdsdhhThOif1vS5Lm1Q/uWkc9a04t0kB9Z2pP1fko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717763287; c=relaxed/simple;
	bh=LwhNQ1eCnRTqzjjHU2aOFHYIf1xQZVUjFs8qXMa6vto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=r/RjE/ih2Ims4C2hdL2Ti0GTVwhZEuv1bpDWjEo1H+ejUM8Hv9lO1HTwHPegG1QQsjHZxXbf1N5S0Ih9usPxMKOaDhdqSoQNEnh2I3vjnarUUpArHyUItF29GJWQ8RKuqIQRXFHRqd1BlEM9eWYaDu3lAYeyLZKeEoMYzaLFkrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tl0jgh+0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tl0jgh+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717763285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KbWgNDxp6kqI8KSc+gmSAycDQgB7Zp2ds8pce0lyFW0=;
	b=Tl0jgh+01WQQ8Z9z63X0GiZZxOi6rlT7DNuODJh0e6HJrrNSfNmE75sasEfh6Om3DQkwn7
	XOHLavhNPqmtlV08EyrISImFdFvVdj1C/KgvNrEVuVMpNnfICQDfcA3fep+hkntFl28qVX
	yHpBjz3Rl5pObidD7aACy0zH5AucH2o=
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com
 [209.85.166.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-9igSviLNOdOAp89K2WLarw-1; Fri, 07 Jun 2024 08:28:03 -0400
X-MC-Unique: 9igSviLNOdOAp89K2WLarw-1
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-7e20341b122so222084139f.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 07 Jun 2024 05:28:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717763283; x=1718368083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbWgNDxp6kqI8KSc+gmSAycDQgB7Zp2ds8pce0lyFW0=;
        b=b20iVi4YVq7VrBmATK1WR7ZIqE0aEpSs0njfJCikzvTwnfjMbJFelwCEQMnLBb1qkp
         US6KY2y/x4RK+cyQYb0fL7yuvOpxrywksnLkK65jWmuFA4bXPqbLQyR2weLKkOn54bJI
         Au3Q4I1BNhEGpKPCTNulAhp5cQMxCpyAUTqVbvNLhQJOrOLJZUq76B+Vf4uem3Z1ejAk
         VHk84eMsH7Msk5Hor6YQLaaPivumLQyf7mJwmPvCJnklQrgnFuL2F52Q+1jk15Vc+glA
         q3ncflHUXeO41ftHieLUjRMk0kc/tIA1DLllU+yLhSNzAXk3437Xqw9PpgR/EQ0Iwu6V
         G3wg==
X-Forwarded-Encrypted: i=1; AJvYcCWcPRo2kDd037N8W5AVK1lDT7CuRP242MqKXfqnOsLPV3LtClr8tQslZinbvK3VBGmZWjZRRLTiSI+yB5qSODU2qxOKemIErWt8x0FJIw==
X-Gm-Message-State: AOJu0YyC2LtuzafdddP8W0OAIb57WVKCodJABeG8VVh0G/ks3IDV+jV5
	Ok2GbqSsnQ48j/IXWd0MZZklbuFQWUPl5qH9TKC+9pXAyMoCT3V2qsSTC1F9eltv0ugn7SAHeC+
	wGcBOhe1rgFeZdZozdrTVAwmWv/IEldvhMg7nsPtZXBLNRVxm5TR0XcSlnqBCWHA=
X-Received: by 2002:a05:6602:3f94:b0:7eb:54ed:b5a7 with SMTP id ca18e2360f4ac-7eb57214c4dmr298377439f.10.1717763282152;
        Fri, 07 Jun 2024 05:28:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkQ/weh8538++SUkRqyPxVISqGPPf+OfZIrUi8Bg5xu2zrDrA/DcENnY/2SmEnB/E3niLYSQ==
X-Received: by 2002:a05:6602:3f94:b0:7eb:54ed:b5a7 with SMTP id ca18e2360f4ac-7eb57214c4dmr298371939f.10.1717763281515;
        Fri, 07 Jun 2024 05:28:01 -0700 (PDT)
Received: from localhost ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b7c2273238sm58172173.102.2024.06.07.05.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 05:28:01 -0700 (PDT)
Date: Fri, 7 Jun 2024 20:26:39 +0800
From: Coiby Xu <coxu@redhat.com>
To: kernel test robot <lkp@intel.com>, Baoquan He <bhe@redhat.com>
Cc: kexec@lists.infradead.org, oe-kbuild-all@lists.linux.dev, 
	Ondrej Kozina <okozina@redhat.com>, Milan Broz <gmazyland@gmail.com>, 
	Thomas Staudt <tstaudt@de.ibm.com>, Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>, 
	Kairui Song <ryncsn@gmail.com>, Jan Pazdziora <jpazdziora@redhat.com>, 
	Pingfan Liu <kernelfans@gmail.com>, Dave Young <dyoung@redhat.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Dave Hansen <dave.hansen@intel.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, 
	Eric Biederman <ebiederm@xmission.com>
Subject: Re: [PATCH v4 3/7] crash_dump: store dm keys in kdump reserved memory
Message-ID: <um2wwcbti6vyu72lbjhh3ywzzardeize2joi5qedvzce277hav@f5bfokh3k7po>
References: <20240523050451.788754-4-coxu@redhat.com>
 <202405241012.KlmCbp77-lkp@intel.com>
 <Zl8ckh7FBErY3Oh6@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <Zl8ckh7FBErY3Oh6@MiWiFi-R3L-srv>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, Jun 04, 2024 at 09:54:26PM +0800, Baoquan He wrote:
>Hi Coiby,

Hi Baoquan,

>
>On 05/24/24 at 11:17am, kernel test robot wrote:
>> Hi Coiby,
>>
>> kernel test robot noticed the following build errors:
>>
>> [auto build test ERROR on de7e71ef8bed222dd144d8878091ecb6d5dfd208]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/kexec_file-allow-to-place-kexec_buf-randomly/20240523-130727
>> base:   de7e71ef8bed222dd144d8878091ecb6d5dfd208
>> patch link:    https://lore.kernel.org/r/20240523050451.788754-4-coxu%40redhat.com
>> patch subject: [PATCH v4 3/7] crash_dump: store dm keys in kdump reserved memory
>> config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240524/202405241012.KlmCbp77-lkp@intel.com/config)
>> compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240524/202405241012.KlmCbp77-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202405241012.KlmCbp77-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>
>Please respond to lkp report sooner, otherwise the reproducer link could
>be unavailable.

Thanks for the reminder! I believe these errors are false positives
because 1) include/linux/kexec.h is included after "#include <linux/crash_dump.h>"
and 2) similar errors are seen for kernel/kexec_file.c by 
"make ARCH=arm CROSS_COMPILE=arm-linux-gnu- kernel/kexec_file.o"

>
>>
>>    kernel/crash_dump_dm_crypt.c: In function 'crash_load_dm_crypt_keys':
>> >> kernel/crash_dump_dm_crypt.c:158:16: error: variable 'kbuf' has initializer but incomplete type
>>      158 |         struct kexec_buf kbuf = {
>>          |                ^~~~~~~~~
>> >> kernel/crash_dump_dm_crypt.c:159:18: error: 'struct kexec_buf' has no member named 'image'
>>      159 |                 .image = image,
>>          |                  ^~~~~
>>    kernel/crash_dump_dm_crypt.c:159:26: warning: excess elements in struct initializer
>>      159 |                 .image = image,
>>          |                          ^~~~~
>>    kernel/crash_dump_dm_crypt.c:159:26: note: (near initialization for 'kbuf')
>> >> kernel/crash_dump_dm_crypt.c:160:18: error: 'struct kexec_buf' has no member named 'buf_min'
>>      160 |                 .buf_min = 0,
>>          |                  ^~~~~~~
>>    kernel/crash_dump_dm_crypt.c:160:28: warning: excess elements in struct initializer
>>      160 |                 .buf_min = 0,
>>          |                            ^
>>    kernel/crash_dump_dm_crypt.c:160:28: note: (near initialization for 'kbuf')
>> >> kernel/crash_dump_dm_crypt.c:161:18: error: 'struct kexec_buf' has no member named 'buf_max'
>>      161 |                 .buf_max = ULONG_MAX,
>>          |                  ^~~~~~~
>>    In file included from include/linux/limits.h:7,
>>                     from include/linux/thread_info.h:12,
>>                     from include/asm-generic/preempt.h:5,
>>                     from ./arch/arm/include/generated/asm/preempt.h:1,
>>                     from include/linux/preempt.h:79,
>>                     from include/linux/rcupdate.h:27,
>>                     from include/linux/rbtree.h:24,
>>                     from include/linux/key.h:15,
>>                     from kernel/crash_dump_dm_crypt.c:2:
>>    include/vdso/limits.h:13:25: warning: excess elements in struct initializer
>>       13 | #define ULONG_MAX       (~0UL)
>>          |                         ^
>>    kernel/crash_dump_dm_crypt.c:161:28: note: in expansion of macro 'ULONG_MAX'
>>      161 |                 .buf_max = ULONG_MAX,
>>          |                            ^~~~~~~~~
>>    include/vdso/limits.h:13:25: note: (near initialization for 'kbuf')
>>       13 | #define ULONG_MAX       (~0UL)
>>          |                         ^
>>    kernel/crash_dump_dm_crypt.c:161:28: note: in expansion of macro 'ULONG_MAX'
>>      161 |                 .buf_max = ULONG_MAX,
>>          |                            ^~~~~~~~~
>> >> kernel/crash_dump_dm_crypt.c:162:18: error: 'struct kexec_buf' has no member named 'top_down'
>>      162 |                 .top_down = false,
>>          |                  ^~~~~~~~
>>    kernel/crash_dump_dm_crypt.c:162:29: warning: excess elements in struct initializer
>>      162 |                 .top_down = false,
>>          |                             ^~~~~
>>    kernel/crash_dump_dm_crypt.c:162:29: note: (near initialization for 'kbuf')
>> >> kernel/crash_dump_dm_crypt.c:163:18: error: 'struct kexec_buf' has no member named 'random'
>>      163 |                 .random = true,
>>          |                  ^~~~~~
>>    kernel/crash_dump_dm_crypt.c:163:27: warning: excess elements in struct initializer
>>      163 |                 .random = true,
>>          |                           ^~~~
>>    kernel/crash_dump_dm_crypt.c:163:27: note: (near initialization for 'kbuf')
>> >> kernel/crash_dump_dm_crypt.c:158:26: error: storage size of 'kbuf' isn't known
>>      158 |         struct kexec_buf kbuf = {
>>          |                          ^~~~
>> >> kernel/crash_dump_dm_crypt.c:187:20: error: 'KEXEC_BUF_MEM_UNKNOWN' undeclared (first use in this function)
>>      187 |         kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>>          |                    ^~~~~~~~~~~~~~~~~~~~~
>>    kernel/crash_dump_dm_crypt.c:187:20: note: each undeclared identifier is reported only once for each function it appears in
>> >> kernel/crash_dump_dm_crypt.c:188:13: error: implicit declaration of function 'kexec_add_buffer' [-Werror=implicit-function-declaration]
>>      188 |         r = kexec_add_buffer(&kbuf);
>>          |             ^~~~~~~~~~~~~~~~
>>    kernel/crash_dump_dm_crypt.c:158:26: warning: unused variable 'kbuf' [-Wunused-variable]
>>      158 |         struct kexec_buf kbuf = {
>>          |                          ^~~~
>>    cc1: some warnings being treated as errors
>>
>>
>> vim +/kbuf +158 kernel/crash_dump_dm_crypt.c
>>
>>    155	
>>    156	int crash_load_dm_crypt_keys(struct kimage *image)
>>    157	{
>>  > 158		struct kexec_buf kbuf = {
>>  > 159			.image = image,
>>  > 160			.buf_min = 0,
>>  > 161			.buf_max = ULONG_MAX,
>>  > 162			.top_down = false,
>>  > 163			.random = true,
>>    164		};
>>    165	
>>    166		int r;
>>    167	
>>    168		if (state == FRESH)
>>    169			return 0;
>>    170	
>>    171		if (key_count != keys_header->key_count) {
>>    172			pr_err("Only record %u keys (%u in total)\n", key_count,
>>    173			       keys_header->key_count);
>>    174			return -EINVAL;
>>    175		}
>>    176	
>>    177		image->dm_crypt_keys_addr = 0;
>>    178		r = build_keys_header();
>>    179		if (r)
>>    180			return r;
>>    181	
>>    182		kbuf.buffer = keys_header;
>>    183		kbuf.bufsz = keys_header_size;
>>    184	
>>    185		kbuf.memsz = kbuf.bufsz;
>>    186		kbuf.buf_align = ELF_CORE_HEADER_ALIGN;
>>  > 187		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
>>  > 188		r = kexec_add_buffer(&kbuf);
>>
>> --
>> 0-DAY CI Kernel Test Service
>> https://github.com/intel/lkp-tests/wiki
>>
>

-- 
Best regards,
Coiby

