Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BF1227B95
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 19:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755285351; cv=none; b=logc+/WmeSv2uBTlbbkRNptJ+ZdCDHaZBEgean6r79H62hUPhs9oMqQssezWZBKs5uH84U+JnXBaJT7IHBn0zuDQAVIJ+wgWGZfQhcgSC7pte+nhMxU4URqTTqfHGMa38KKURrAwBGbb0OEieZI5lJDy2S3Zvn0rBEVSiYlRnYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755285351; c=relaxed/simple;
	bh=lSj71HO5GzYbckw7cBnMW50k4sxnSp1OOCtqeugcrA8=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=nG41mfedJj5uUQAhSE41i/EKWVXBw8kFUJ9odSvQHkGRBbYGjGVB+4/LvAY42YXIjK693+2djH8tYlDsWyGwKF7CZNIS3eRWfAVtfKmCSvLN7U2OAcZo7LupEOLHyiCr70GLgUzOkLPd4TpEGqRzAWnpi1ap8Ba9r4+oqb2T4cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Qam94Wjc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Qam94Wjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755285348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=INM/nkZzXvOTsRuMaWEN8yu2b6nIHVl1/NxBWD2ETvA=;
	b=Qam94Wjc0kKcWVxlBxWki5maei5bjgh3EVtNFUy9ZSpSII3yABaCU6Lkomer9rzoVfI0P7
	DtY5AhaF8s+sXc3UGn58jb7qs5DZzOBfKK8n77wT5S12Um37zB61K55uG57Ss6TTzHSs4J
	9I+BTMSEVjZnes0I6iZCeAbZq4RC0fE=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-1g46u5NNMq-oww6IU5RYvg-1; Fri, 15 Aug 2025 15:15:47 -0400
X-MC-Unique: 1g46u5NNMq-oww6IU5RYvg-1
X-Mimecast-MFC-AGG-ID: 1g46u5NNMq-oww6IU5RYvg_1755285347
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a9f5b3601so52467976d6.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 12:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755285347; x=1755890147;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INM/nkZzXvOTsRuMaWEN8yu2b6nIHVl1/NxBWD2ETvA=;
        b=Df9fmn81DM5qk5KtWrzFdevVA9CKZawmftlvyS511E6LcNb0PbQNXwlI+2tVlrQ0ya
         e2CmVTsMw/FbUB8zqRnH03dN2ggxebHbba5pYDFrd2nLRJOLMtk9CWI+u95nGELuCReS
         84FoktYKj0JDFW3DbfP5voU2VxgyrFUBWOs5aVSTXQnMcHPjB0zLPhFFwInaQMepXGIm
         DVxiFnTY3skDq4Z50Zxlqzk+BTPCMgA2blZCkCzh6ZJxWpYVKspERBrI54jHnsgforbZ
         WoZW4ppsy73ivP0mpqNnUgZtVpTeiJja6xCthVcuE7KEr9J/S6GT12cawNi7ly+G2FbD
         cP2A==
X-Gm-Message-State: AOJu0YxwTfUajCZpEJuKaAM2lg+Ql2NCv4nrZE5GMSeNAyGOZc47eG3R
	WcY902FwcwJ3NJPYMqTxIheHIq5TRraOL4qVZF3k+bscyakswH3+Tq3ba7CF7rTH2kdhy529L+M
	U4ZD8nmdifZGottAItZUSO+fKzkY+mRjuMtPNGHrahMxOF9Nmkge40B74F8nmNJqoFjU=
X-Gm-Gg: ASbGnctYKPviEm/PmhAzaKi66KewjE0fNpktbm7xv/Bsd738Qff0OpNbggTqAziyCxu
	3bHpJkAvdwAlfrd1JZK5VoOC43Y3az6kGNaoctGYw5INpeOaiLflKX8Q+fgc7bRhWlHC8vFk6WH
	j9xZm6ACZWnh3F0J1dBVtIIV1krx8M3+YShljF2OTPbzKMexSZAqB5poMfX6D4og2PgG2hkaU61
	y03qG4ZMNjTeSTuLrnsLRYqqUJGSdOx2Q26OvjxWjo3h7lS6k2DztjAIA5bQYBAis9+aNWoEIoi
	ldxwRSDJa2t8uM/0xzKZtcbUi2bzQNKcIn8L0wrLmaUWHVON8kXiE1gElpUKg080Bjsg69Kcc1M
	ERE4QMQUdrg==
X-Received: by 2002:a05:6214:2522:b0:707:48b3:132 with SMTP id 6a1803df08f44-70bb04c04femr2029896d6.0.1755285346262;
        Fri, 15 Aug 2025 12:15:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6iyDjW6RyozXA8YvlziiALssSDGwSrln6G47qwGj99VGsN/w0n7YA7sGWwplO+Ka5maXxjQ==
X-Received: by 2002:a05:6214:2522:b0:707:48b3:132 with SMTP id 6a1803df08f44-70bb04c04femr2029486d6.0.1755285345832;
        Fri, 15 Aug 2025 12:15:45 -0700 (PDT)
Received: from ?IPV6:2601:188:c180:4250:ecbe:130d:668d:951d? ([2601:188:c180:4250:ecbe:130d:668d:951d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70bae08c0f9sm7904296d6.11.2025.08.15.12.15.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 12:15:45 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <15b47a34-ea8a-4a07-bc1e-5ba886010721@redhat.com>
Date: Fri, 15 Aug 2025 15:15:44 -0400
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [-next v2 3/4] cpuset: separate tmpmasks and cpuset allocation
 logic
To: Chen Ridong <chenridong@huaweicloud.com>,
 kernel test robot <lkp@intel.com>, tj@kernel.org, hannes@cmpxchg.org,
 mkoutny@suse.com
Cc: oe-kbuild-all@lists.linux.dev, cgroups@vger.kernel.org,
 linux-kernel@vger.kernel.org, lujialin4@huawei.com, chenridong@huawei.com,
 christophe.jaillet@wanadoo.fr
References: <20250813082904.1091651-4-chenridong@huaweicloud.com>
 <202508140524.S2O4D57k-lkp@intel.com>
 <bd043822-29b2-49f4-864d-6658741f572c@huaweicloud.com>
In-Reply-To: <bd043822-29b2-49f4-864d-6658741f572c@huaweicloud.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QVrXKLclCwankgPBDrMcCd-Wxg9tMvY2tQ61bMwGvQs_1755285347
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/14/25 8:44 PM, Chen Ridong wrote:
>
> On 2025/8/14 5:28, kernel test robot wrote:
>> Hi Chen,
>>
>> kernel test robot noticed the following build warnings:
>>
>> [auto build test WARNING on tj-cgroup/for-next]
>> [also build test WARNING on linus/master v6.17-rc1 next-20250813]
>> [If your patch is applied to the wrong git tree, kindly drop us a note.
>> And when submitting patch, we suggest to use '--base' as documented in
>> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>>
>> url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Ridong/cpuset-remove-redundant-CS_ONLINE-flag/20250813-164651
>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git for-next
>> patch link:    https://lore.kernel.org/r/20250813082904.1091651-4-chenridong%40huaweicloud.com
>> patch subject: [-next v2 3/4] cpuset: separate tmpmasks and cpuset allocation logic
>> config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250814/202508140524.S2O4D57k-lkp@intel.com/config)
>> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
>> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508140524.S2O4D57k-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/oe-kbuild-all/202508140524.S2O4D57k-lkp@intel.com/
>>
>> All warnings (new ones prefixed by >>):
>>
>>>> Warning: kernel/cgroup/cpuset.c:422 function parameter 'pmasks' not described in 'alloc_cpumasks'
> Hi all,
>
> Thank you for the warning about the comment issue - I will fix it in the next version.
>
> I will be appreciate if you can review this patch. If you have any feedback, I can update the entire
> series together.
>
Sorry for not responding to this patch. It looked reasonable to me. I 
did miss the error in the comment though. Fortunately it was caught by 
the test robot.

Cheers,
Longman

