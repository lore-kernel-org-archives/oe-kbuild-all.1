Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E3D290A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 11:14:45 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-94f32588c13so1466504966b.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 04:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tessares.net; s=google; t=1682680484; x=1685272484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rC6Pm3ksFygA2vMrmoy279inEVU/8X8+FukvfGD5RGM=;
        b=pqXE3zYKnWm2LWJCVzJQK8v+8U6NZxhhNxcxEPr6yFbKJK/n5cfMNexl7S4dXyLurC
         pw1TG+Auuf23g1VHNCtL+qFdgb270UQJG5KgS42ERTZw58gF4zZVoyHze5pljSVfYeGt
         6aksgu+CQk2xVHRFDsOmE3LKQziivCg/k/KoVdqKwn2h0vs0mm66SbPZ9ZL0ECnEfgDD
         TN6+ZfnBCmH1bF0e7onCkisweYfj7fcIz7Lopb1PhLp838ejxRQ7dJAkvo/JMTs8PB4+
         FtrERIpiT3zF61MTodXWfFWl+h0G4RIXbujyeJ+CTtz3kVVHa/2Zc8i+PNUVhs2kLrZD
         T8ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682680484; x=1685272484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rC6Pm3ksFygA2vMrmoy279inEVU/8X8+FukvfGD5RGM=;
        b=aa3p8cxghrrm9LQtSvVw35vP94bRn0EEIu+iGJQlDXi6AaPSR2Zf5UUVn/4nbx/zPd
         ZNG0YcHhx6sthuWS5nCnXpudyz0NL1btm5SAHZN7b+RMthZSzlOC51CVYKgF6Sg15+IZ
         wgQEZ+Wqo7Xad3kbJPq5GOcTwRqbvNk2w8lkZCYo5O6KO0YV1uOmEX7YfXAfbRK/f83r
         ASE1RAOKey6wd3pE/K5wl2y/5fpkGnfd6c1m8i/9gthL80tq7PLqgeMg+FxIhIKByB0F
         HpzcPOg+X//SBCVCWYjpZ2q7PA8/FBrsikTgrY1eyY8IgBB+OgT8ZdNqsqsh7RdiJxuW
         r+7A==
X-Gm-Message-State: AC+VfDwP8wFgCOKX1u+ydELqh/ftW57u2H7sN6l8lO0wStL3X6Clj9BW
	D4tHQiVWM/bmMwWGons+XcK0Jw==
X-Google-Smtp-Source: ACHHUZ7PG7MGg6L8agrSW7fpRDab4GLP4U5E4Wnqdc9XNFyxhJtte80nHDCHNeBbDsm+lDA6m144ZA==
X-Received: by 2002:a17:907:749:b0:94f:e98:4e94 with SMTP id xc9-20020a170907074900b0094f0e984e94mr4539063ejb.47.1682680483905;
        Fri, 28 Apr 2023 04:14:43 -0700 (PDT)
Received: from [10.44.2.5] ([81.246.10.41])
        by smtp.gmail.com with ESMTPSA id vc14-20020a170907d08e00b00959c07bdbc8sm6179695ejc.100.2023.04.28.04.14.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 04:14:43 -0700 (PDT)
Message-ID: <0e366eea-0590-e1da-6f30-747ac4ebb74b@tessares.net>
Date: Fri, 28 Apr 2023 13:14:42 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 5.15] selftests: mptcp: join: fix "invalid address,
 ADD_ADDR timeout"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: kernel test robot <lkp@intel.com>, stable@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
References: <ZEuV586CQyHtECVB@afc780e125e2>
 <d43a4e40-231d-879f-905d-c258e6d688a8@tessares.net>
 <2023042842-coleslaw-baffle-a9e2@gregkh>
Content-Language: en-GB
From: Matthieu Baerts <matthieu.baerts@tessares.net>
In-Reply-To: <2023042842-coleslaw-baffle-a9e2@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/04/2023 13:12, Greg KH wrote:
> On Fri, Apr 28, 2023 at 12:30:00PM +0200, Matthieu Baerts wrote:
>> On 28/04/2023 11:46, kernel test robot wrote:
>>> FYI: kernel test robot notices the stable kernel rule is not satisfied.
>>>
>>> Rule: 'Cc: stable@vger.kernel.org' or 'commit <sha1> upstream.'
>>> Subject: [PATCH 5.15] selftests: mptcp: join: fix "invalid address, ADD_ADDR timeout"
>>> Link: https://lore.kernel.org/stable/20230428-upstream-stable-20230428-mptcp-addaddrdropmib-v1-1-51bca8b26c22%40tessares.net
>>>
>>> The check is based on https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
>>>
>>> Please ignore this mail if the patch is not relevant for upstream.
>>
>> @Stable team: I confirm, this is not relevant for upstream, this is a
>> specific patch for v5.15 only.
> 
> Not a problem, now queued up, thanks!
Thank you!

Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
