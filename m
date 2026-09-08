Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388D9478E45
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Sep 2026 08:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788856362; cv=none; b=noor1u1kexNq3L36gQd0DZD/WAs4qR4mAvFWVwh68XfMjwYAQQ54611mCv/HhhfVQFjEk6SZC4+V/m/xLuY8Ogd97hZDK8hYLFmMKe975o1xg9bLaQQ4VDPdliITiR5SdUk4HT1yxmLVDEMLX85tP8xgtzYg6FUvLG/X+BQaP10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788856362; c=relaxed/simple;
	bh=E7eYuLoZleOAMi5aybzFXUMotlL4x/aHsP+MlHsKC0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R90fYWKuvBkzYFHtV1x1y8S2pR4O+Tm2T1/5FSoQA+5vixgm5xTpWOTp28ak24YWkme3p4umRifwHFEqQ7zXJkC/gMCPWIwIswVpEY9aeYe1JTnIHaf+HCpq+YXBU6NTV8iBatGEhTzynSku9t38CCmbn+aS+PaU2UdB0PFsg+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtnmpG7V; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtnmpG7V"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-485843aeab8so4863149f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 08 Sep 2026 01:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788856359; x=1789461159; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRu051t1h1A6nzfqSoDX3YwLGwKiY0jwf7brkaReOLM=;
        b=OtnmpG7VxnebYbLZubFbushTRpq8A2Dv3M9aSjoR3fhEHg1NwK81/GIjuIguNK1uUp
         C9JDigzyVXKjUet4z9StV+IC7JYgygPj9H7cv8A70uOhfeJIjQKWMfS5F1DH7THzkyDb
         /OtCVOV3rdqONvaEZE3GbBykIqpItmVVJKu8PLX7hRDJwoBreJAHXnNYTfR4ZSGTP9M9
         4oPLWQM7D2vao4XZPsDUw8CBTKCLQm1zwKnKdNDwseD0TXuBYhxXCYLuny+ixIGL0Lwa
         4c9mMhcD4Fuj2UFJhPn0Apjff3vF3ObighP6GKqrx9RQKktL4mCPck//lPQrpLm+DS0T
         1zyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788856359; x=1789461159;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRu051t1h1A6nzfqSoDX3YwLGwKiY0jwf7brkaReOLM=;
        b=GxNdwFRtxpheiaME2bKsHfQyHiY8pyP4FnZVa7UTFveyo7QWtWu41JQGjrK9SgJ/Ez
         3zLJD9lS9PR+rZI88UFxRGt8j07d5v5MjiHrbSUXFu1pKCN2LH//T13XYoskIut30Fc1
         Yj8HLKVGHcgK07v3k7/kwuacmungNBPjgxvb/SjoIH3KYXT7QcJrjPWASPoY9vGiEACh
         eaJm2k1ytG+EaP62FKJ2NszJ8oq8i9+HPOEi8gUer552FrZ7xi2115JDEq/h7DObIfrz
         ju7aH3vRCNVsbPK4mHTHPy2Ex87RS/1lOrY3R3aXiR3HHSuiaXp89gJkw4Vr1Pnc/V5Q
         VuOQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmEXyjRQ8Ik6x7ENNzcf6Hb0Y029kuiYsaWMfZmAs5TWgBpRZPvKb5xUds8Q4CuQ5JXL9i1xvZFb0XJHGh@lists.linux.dev
X-Gm-Message-State: AFuF++nv5yNfnz582ku7wI4xOHKYfM29MUy8conZyUV7I5CcG9UP+3Hq
	n2NoFeu+s8EHyldsbSeRVIFLAcQWnLlakL0LgVjYeeK6iYFhvowPD9v3
X-Gm-Gg: AYBFou3CgibvD6BIh2uUof4zWnA22+IcC4tKAyQFuVs5weFHRIy7D7rdLip9WHrlkdj
	bKL/NlKq287M3OY3Uu4FKbuA3PN26uYV60EeWG57xJfdRVGzxDl+gI3EyZw84Iz37ZdsGU9gQ73
	TNI1Z2qXXaI0Q7G9yV/APJaVnvOX+OTkz7/eqERpVLnNo3icPCy2dKoC1vbArS90p+dtBV3YSf6
	gOgdRTF/kzCmSQAL63224BOgEHmRBgoySPrlItvI+MzIUTVdev639oc0NsOxArlavyi1ubXGlLS
	pRPmtacwv3cZ8ZMzpKT2OnEssQjwYCsuuIuTfpYh2XnSUIFtVR8p9q/GE/8Z0rz1hfhGmbRkKFg
	Yv0xykT/9uRqin1Xap7EPwmm3qfpf4roM/aWOF7f/UHossRgG/ufjJ4MYo4t6eTKfCj9J8OYCsx
	NU1c+tG5dcJiLT5Ewu5vzNWsjjea/6wmvGH4Q/I3bj5pF9UJEdRRVnH7AlxsNEe6DtJmUk9X7dm
	A0V3ICoLGlltXG/JtZYRyqukshQlHxAB4USsPCC/cDTrAQA5EBrqE61QGo0fC64Ocitzk6NgrXu
	HCvvT7WeJYtL6IOX/fLeZXaqrPun7u49+iuX2ZPVjePxFcGooK7cjPWeNA9XrHug+5ZVYzXpb21
	PvUOP/ZNl9wrRf6S6yL0II/DzanfJuane8g==
X-Received: by 2002:a5d:588f:0:b0:485:847f:fd9b with SMTP id ffacd0b85a97d-48586e4a62bmr48379038f8f.6.1788856359104;
        Tue, 08 Sep 2026 01:32:39 -0700 (PDT)
Received: from [192.168.100.51] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm35535684f8f.4.2026.09.08.01.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:32:38 -0700 (PDT)
Message-ID: <9fd0ed6b-e732-4485-a7b5-0380b07d3fc4@gmail.com>
Date: Tue, 8 Sep 2026 10:32:36 +0200
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: remove unnecessary ret variable in
 ocfs2_calc_xattr_init()
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>,
 Andrew Morton <akpm@linux-foundation.org>, kernel test robot
 <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, ocfs2-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202609040247.8B3lmoqX-lkp@intel.com>
 <20260907132202.48834-1-krystianmkaniewski@gmail.com>
 <b63bd2bd-229f-4636-9c89-8f1686ab087d@linux.alibaba.com>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <b63bd2bd-229f-4636-9c89-8f1686ab087d@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hey Joseph,

Thanks for letting me know and let's drop this patch then. I've just 
received an email a few days ago after my patch was applied to upstream 
Linux and there was this finding, however I didn't expect it's already 
addressed.

On 9/8/2026 3:23 AM, Joseph Qi wrote:
> Hi,
> This has already been addressed by:
> ed57836ff300 ocfs2: make ocfs2_calc_xattr_init() return void
>
> Thanks,
> Joseph
>
> On 9/7/26 9:22 PM, Krystian Kaniewski wrote:
>> Commit bd7c05fb4a47 ("ocfs2: fix circular locking dependency in
>> ocfs2_init_acl()") removed the only code that could change ret in
>> ocfs2_calc_xattr_init(). The variable is now always zero, so remove it
>> and return zero directly.
>>
>> This fixes the reported Coccinelle warning without changing behavior.
>>
>> Fixes: bd7c05fb4a47 ("ocfs2: fix circular locking dependency in ocfs2_init_acl()")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202609040247.8B3lmoqX-lkp@intel.com/
>> Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
>> ---
>>   fs/ocfs2/xattr.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
>> index 35bcbb0ff607..ab3b645983c9 100644
>> --- a/fs/ocfs2/xattr.c
>> +++ b/fs/ocfs2/xattr.c
>> @@ -640,7 +640,6 @@ int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
>>   			  int *want_clusters, int *xattr_credits,
>>   			  int *want_meta, struct ocfs2_acl_state *acl_state)
>>   {
>> -	int ret = 0;
>>   	struct ocfs2_super *osb = OCFS2_SB(dir->i_sb);
>>   	int s_size = 0, a_size = 0, acl_len = 0, new_clusters;
>>   
>> @@ -662,7 +661,7 @@ int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
>>   	}
>>   
>>   	if (!(s_size + a_size))
>> -		return ret;
>> +		return 0;
>>   
>>   	/*
>>   	 * The max space of security xattr taken inline is
>> @@ -729,7 +728,7 @@ int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
>>   		}
>>   	}
>>   
>> -	return ret;
>> +	return 0;
>>   }
>>   
>>   static int ocfs2_xattr_extend_allocation(struct inode *inode,
>>
>> base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
