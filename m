Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDB020EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 07:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678952286;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iVY81PmIkLhnMcZY8bxi+8If5ywAumxCAv/0i9PQtGA=;
	b=ICujeOh9KZGzaWDOEzl1LWYBmsv5n8tEcfHJ3g5948gI+YV/kZkADvCLEzRCB0Y28bQlma
	/OOPYuFGSKpDSENMOKrNxl/t/TIID0prPri5KqUvTKb9zwI6SBQn732EyU1h0mof1OojAg
	bzTIbR3C5lttmW4QzHTDP8sRLtmKIk8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-iXTb453zPOSuk8zzSiDibw-1; Thu, 16 Mar 2023 03:37:57 -0400
X-MC-Unique: iXTb453zPOSuk8zzSiDibw-1
Received: by mail-ed1-f69.google.com with SMTP id t14-20020a056402240e00b004fb36e6d670so1748229eda.5
        for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Mar 2023 00:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678952276;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iVY81PmIkLhnMcZY8bxi+8If5ywAumxCAv/0i9PQtGA=;
        b=38JWrzQhL4k10UP6vvvO0wL599lVbBzWxcu0mC+JTVYthnp+vkkRyH/DfhTlEbWRDq
         dDpLm+SUzfmazljRY3FS6w9QEDIlNl1U2hEfzF7d1Z91dUv2zu8RXHesCNXk40cbFKEO
         pWb3Q21x5lzSumjmb+gDHynUnpwta3mpkhPWFvuTVaI0Shem8UB9ebLzyBaIP8uiSA/E
         KADSt8f3zeLrABhXxt6YtKTVfn2yF9qiow0sWzg5o7rhgWT+woa38OoGEzu64qGWy/z6
         FLnsJnSgl5X2Izmf/Ev8pTBSjOGXqd6gLAjBqB8nyKn83QZGEVON+OH1/HLwP/VjP8QM
         mOzQ==
X-Gm-Message-State: AO0yUKUie9sHQbuitchny9QzFLGHlm556inIBgl98FJGi9rEp6MFle39
	S5P7nELHUru5zNjvietv/IG6kokXrowWlmDvz7mvLYiyoXfuUpKVskHTVmDbhgHn7BS8BZF3njq
	/o3WF0jR1gS2oM3r5R50/UgI5
X-Received: by 2002:a17:907:1c27:b0:92f:bef6:7843 with SMTP id nc39-20020a1709071c2700b0092fbef67843mr4183707ejc.22.1678952276704;
        Thu, 16 Mar 2023 00:37:56 -0700 (PDT)
X-Google-Smtp-Source: AK7set+K7+j0zOimzl4B3ORDf6GGQvsgdfe9Nsc+8RAXvdyrJiTosutBWT06KzKUC0ktZqJTfcE4hA==
X-Received: by 2002:a17:907:1c27:b0:92f:bef6:7843 with SMTP id nc39-20020a1709071c2700b0092fbef67843mr4183681ejc.22.1678952276433;
        Thu, 16 Mar 2023 00:37:56 -0700 (PDT)
Received: from [10.43.17.73] (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id q19-20020a17090676d300b00922f76decefsm3512243ejn.99.2023.03.16.00.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 00:37:55 -0700 (PDT)
Message-ID: <6c8f828c-3995-a9b0-3bdd-37724e96a4ce@redhat.com>
Date: Thu, 16 Mar 2023 08:37:55 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH bpf-next v10 1/2] bpf: Fix attaching
 fentry/fexit/fmod_ret/lsm to modules
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 kernel test robot <lkp@intel.com>
Cc: bpf <bpf@vger.kernel.org>, clang-built-linux <llvm@lists.linux.dev>,
 oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>
References: <3f6a9d8ae850532b5ef864ef16327b0f7a669063.1678432753.git.vmalik@redhat.com>
 <202303160919.SGyfD0uE-lkp@intel.com>
 <CAADnVQJ+-ThSUMzEgWu6OtkWB-bdqZKPiRxWUEbL5L=cPjeezg@mail.gmail.com>
 <CAADnVQKWtWZg+zHfA2AOwwMKipWog-MpeR88AcXN=bJuuQu6_g@mail.gmail.com>
From: Viktor Malik <vmalik@redhat.com>
In-Reply-To: <CAADnVQKWtWZg+zHfA2AOwwMKipWog-MpeR88AcXN=bJuuQu6_g@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/16/23 02:39, Alexei Starovoitov wrote:
> On Wed, Mar 15, 2023 at 6:34 PM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
>>
>> On Wed, Mar 15, 2023 at 6:32 PM kernel test robot <lkp@intel.com> wrote:
>>>
>>> Hi Viktor,
>>>
>>> Thank you for the patch! Yet something to improve:
>>
>> Argh. Comma is missing.
>> Viktor,
>> please send a fix asap.
> 
> Actually, since it was at the top of bpf-next
> I fixed it myself and force pushed bpf-next.
> 

Ah, I'm sorry, I completely missed that. Thanks for fixing it, Alexei!

Viktor

