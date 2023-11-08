Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3026D374CF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 20:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b7mgJw25"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699475495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=MtB8ohQOEzMANjmqu0FCOmdxHso7iJv2r+v/FvfKTAE=;
	b=b7mgJw25u6G0GW8/4KvoerY1Tw5+jR954EZuIfvRSuPvHP4N6FqoIpHkMTrf0ffvrdd47e
	kdBnKx+qQ5oCI6XIN0WMy+Ad+Hhm5skpTte2di/NA/6U2C8ZfoEfBoy6vVmqlkPhAfSHCz
	dOBzN30rBJJ6orCXPj/doKl2cdBqutA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-HCTDOViRNlSGpH-QhTK9BA-1; Wed, 08 Nov 2023 15:31:32 -0500
X-MC-Unique: HCTDOViRNlSGpH-QhTK9BA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9be601277c2so10312866b.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 08 Nov 2023 12:31:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699475491; x=1700080291;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MtB8ohQOEzMANjmqu0FCOmdxHso7iJv2r+v/FvfKTAE=;
        b=cnRkEy7DJ1O4QOQSeBX9Xs8OQg+3k6Lj2WCRYILoOwChR7q8COGwaYiJfo4Jl4/X8g
         mW5KW4mfTF6fB9rNT9BT9yDS5u5/kEkZYNWKl8JxWun0q+oFO32+2n6sg1uB3lmI9adO
         Pl072MrrPnqMOQf3I6Cj+2UR9HMl/rr76rAjnnloRZjAGl/XlM4bubfLy9oxlZgB8y9U
         wAZHSna4YrNxaqzBe+L4dmJvxoyaqrDgZgiPw8yCOpb/8ZXCMf/io1hT9KGkA0W/GKSh
         fsuMwSbtTTX27ZlnXlYcO8b+enXCeZs9PxGS3fxQxzGLQxjQp/iBS1xkvzrT+oEXsLy3
         NE6w==
X-Gm-Message-State: AOJu0Yz//rD9X2zIfObjomAxN+BiYntYS+ID/my2zOba0qJtUw8f6lvT
	Cp/5mKQlIM1LL84Ydkojt1i09/mHNb8ymPYqh02QE9YFiUrG7XJUttvz2q8wMASezDjeRrWDUpB
	0+/u99J7drrWXVKxWu2DLBlnhMQ==
X-Received: by 2002:a17:907:a4c1:b0:9e3:fbab:e091 with SMTP id vq1-20020a170907a4c100b009e3fbabe091mr1929663ejc.15.1699475491333;
        Wed, 08 Nov 2023 12:31:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHaQFHEMVK2eGELzcR5AsUy+0ZQmgx/f+sWXEc4bB+3m1OFJDynAK5+sSf1PVTvF09KXeogow==
X-Received: by 2002:a17:907:a4c1:b0:9e3:fbab:e091 with SMTP id vq1-20020a170907a4c100b009e3fbabe091mr1929645ejc.15.1699475491070;
        Wed, 08 Nov 2023 12:31:31 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89? ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
        by smtp.googlemail.com with ESMTPSA id a27-20020a1709063a5b00b009c6a4a5ac80sm1519304ejf.169.2023.11.08.12.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Nov 2023 12:31:30 -0800 (PST)
Message-ID: <d47135d7-ee5b-4c57-ac49-e9d94e8fcae2@redhat.com>
Date: Wed, 8 Nov 2023 21:31:29 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm:guestmemfd 59/59]
 arch/s390/kvm/../../../virt/kvm/kvm_main.c:5517:14: error: 'KVM_TRACE_ENABLE'
 undeclared; did you mean 'KVM_PV_ENABLE'?
To: Sean Christopherson <seanjc@google.com>, kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, kvm@vger.kernel.org,
 Robert Hu <robert.hu@intel.com>, Farrah Chen <farrah.chen@intel.com>,
 Danmei Wei <danmei.wei@intel.com>
References: <202311090100.Zt0adRi9-lkp@intel.com>
 <ZUvtbInra7-Nypgq@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <ZUvtbInra7-Nypgq@google.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/8/23 21:19, Sean Christopherson wrote:
> On Thu, Nov 09, 2023, kernel test robot wrote:
>> tree:https://git.kernel.org/pub/scm/virt/kvm/kvm.git  guestmemfd
>> head:   cd689ddd5c93ea177b28029d57c13e18b160875b
>> commit: cd689ddd5c93ea177b28029d57c13e18b160875b [59/59] KVM: remove deprecated UAPIs
> Paolo, I assume you force pushed to guestmemfd at some point at that this is no
> longer an issue?  I can't find the above object, and given the shortlog I'm guessing
> it was a WIP thing unrelated to guest_memfd.

Yes, I had pushed a bit too much.

Paolo

