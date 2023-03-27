Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4408EA3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 11:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679918327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ksZUXeqQLjOqnjygvi6C8c3OQyiIALMueMSaAWpeba0=;
	b=XiWzaGAHrYMRNoIQtP1OHptsvLMnJqi5VWGmAsUWLUh9o7sCK3tMvc0MLRQqnNfwNhZ48M
	4LTXLf+lSNkJFxMvAzhUA765DxnLBq245aAcTwI9RPvrr7Chrwo0n4vRrMc6IOx7C1gDPy
	syB+bLN3+qAEjJIN8POK5J6oQctt6zw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-mKL8aXACPMKBSEQy8I63Hg-1; Mon, 27 Mar 2023 07:58:46 -0400
X-MC-Unique: mKL8aXACPMKBSEQy8I63Hg-1
Received: by mail-ed1-f70.google.com with SMTP id i22-20020a05640242d600b004f5962985f4so12450346edc.12
        for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Mar 2023 04:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679918325;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ksZUXeqQLjOqnjygvi6C8c3OQyiIALMueMSaAWpeba0=;
        b=C0iPKIYwbqvIfsj+yggUOJFGvFX9PmRh+oJrK1FpELJHNhBm8F0hoHLX37BmIwoiMX
         6PRkAUp0M7pHn+PZt6K7Ybor0JVbEa8pwKV25BRwrWf4n4qaVFFIuCumuBN1yLb7EYKG
         Lb/zk8rPoZuxdcmUWBfsA3cp67MDkRFcigy0IvVYKujO3niDlHSk0d5zfOK1WxC5M+kQ
         tUfeI85WvlmRQoYmUN9bSw3X26vWfs4AlbBR6u7fBHWmiO5dCbhAvYLLAr+GUvcrZyif
         aFfsvLQBOl7YqacJlpZf+IRa1mfT3J8ihlyakRB45kYJ911QC1PKhD/2HEYvKYBIEM8u
         gbKg==
X-Gm-Message-State: AO0yUKVyfja4m7Ry9gtsaRNi/7TYzsQzv2LxwrCxfDn9dogESWetW/73
	d7k8QjWigFoKjRq9RWGFG+royxcvvX4oWEQfNBJwUH8UMjERnt2mydLA+NM0o/PcAVaHB07R1ku
	WBbNMUKsxRal5/+UmO/MyRz3Z
X-Received: by 2002:a17:907:3e83:b0:926:4e16:a551 with SMTP id hs3-20020a1709073e8300b009264e16a551mr21835481ejc.30.1679918325564;
        Mon, 27 Mar 2023 04:58:45 -0700 (PDT)
X-Google-Smtp-Source: AK7set+zelmFTjso2/MNz7UlhB4STfMII65Ql2RwQPk9P+jEP9JXnm4Ov1mK2fAgVsw0HDMDpUHlzQ==
X-Received: by 2002:a17:907:3e83:b0:926:4e16:a551 with SMTP id hs3-20020a1709073e8300b009264e16a551mr21835468ejc.30.1679918325323;
        Mon, 27 Mar 2023 04:58:45 -0700 (PDT)
Received: from [192.168.0.159] (185-219-167-205-static.vivo.cz. [185.219.167.205])
        by smtp.gmail.com with ESMTPSA id z1-20020a1709064e0100b00931baabe36csm13920503eju.63.2023.03.27.04.58.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 04:58:45 -0700 (PDT)
Message-ID: <a1b2b45c-acf1-ee63-2056-befc75f10767@redhat.com>
Date: Mon, 27 Mar 2023 13:58:44 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [bpf-next:master 1/2] kernel/bpf/verifier.c:18485: undefined
 reference to `find_kallsyms_symbol_value'
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
References: <202303181535.RFDCnz3E-lkp@intel.com>
 <eccfa9bd-9cb4-2ca4-fcdf-91740bef7057@iogearbox.net>
From: Viktor Malik <vmalik@redhat.com>
In-Reply-To: <eccfa9bd-9cb4-2ca4-fcdf-91740bef7057@iogearbox.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/23 11:00, Daniel Borkmann wrote:
> On 3/18/23 8:49 AM, kernel test robot wrote:
>> tree:   
>> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
>> head:   a466a1a8ee79f10f153c3ad608eb1881d62859e1
>> commit: bd5314f8dd2d41330eecb60f0490c3fcfe1fc99d [1/2] kallsyms, bpf: 
>> Move find_kallsyms_symbol_value out of internal header
>> config: ia64-randconfig-r012-20230312 
>> (https://download.01.org/0day-ci/archive/20230318/202303181535.RFDCnz3E-lkp@intel.com/config)
>> compiler: ia64-linux-gcc (GCC) 12.1.0
>> reproduce (this is a W=1 build):
>>          wget 
>> https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>          chmod +x ~/bin/make.cross
>>          # 
>> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=bd5314f8dd2d41330eecb60f0490c3fcfe1fc99d
>>          git remote add bpf-next 
>> https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git
>>          git fetch --no-tags bpf-next master
>>          git checkout bd5314f8dd2d41330eecb60f0490c3fcfe1fc99d
>>          # save the config file
>>          mkdir build_dir && cp config build_dir/.config
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 
>> make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
>>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 
>> make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash
>>
>> If you fix the issue, kindly add following tag where applicable
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Link: 
>> https://lore.kernel.org/oe-kbuild-all/202303181535.RFDCnz3E-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     ia64-linux-ld: kernel/bpf/verifier.o: in function 
>> `bpf_check_attach_target':
>>>> kernel/bpf/verifier.c:18485: undefined reference to 
>>>> `find_kallsyms_symbol_value'
>>     pahole: .tmp_vmlinux.btf: Invalid argument
>>     .btf.vmlinux.bin.o: file not recognized: file format not recognized
> 
> Viktor, do you plan to send a follow-up today?

Sorry, I was off the entire last week. Sending a fix now.

