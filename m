Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45818224B1E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 13:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761659372; cv=none; b=kktLLn9yLsItnIjY3z+3a7Cktt/HjK6gNzQhDF2mLe6ToUcUaVpr+LhmUOJGT1r2EgnEVEBFNpYaIw23uqNT1sJzBLiRIQgVuhqpaLQFJXbllvKJ3Y6Q8HaDFkujVBHKBZktq3Ldae+NHXphAwWW2uxcrkbJz7a8A05OEjezVNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761659372; c=relaxed/simple;
	bh=qydsrg9DzwE1II5DrJN1ds7pfRcSxEqPV+4GH57S+2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A9aAvU4TlbgXIbR+E9+DxFylT8ePUok0kpt6ryKCy4o0cv37BsvlQ2vTwwhNtryVdTluQU+BlSCARGniCz38dDsCchWQVEv5xjwaMs7zuK3KAZNST1zS0WzKdtTq2lWMT4ybN648yjoHJpPwh/laoRtKaNo91tZt6xopNmiamxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B5995168F;
	Tue, 28 Oct 2025 06:49:22 -0700 (PDT)
Received: from [10.122.4.165] (unknown [10.122.4.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F9573F673;
	Tue, 28 Oct 2025 06:49:30 -0700 (PDT)
Message-ID: <13f227a4-232b-4089-b12a-c6e4752ab445@arm.com>
Date: Tue, 28 Oct 2025 08:49:29 -0500
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Warning: drivers/char/tpm/tpm_crb.c:193 function parameter 'loc'
 not described in '__crb_go_idle'
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
References: <202510241542.hFrped3X-lkp@intel.com>
 <e1d1ffc0-dda5-4501-8bd5-e4e7ea667f10@arm.com> <aP_Q4XCXnBw4Wv0N@kernel.org>
Content-Language: en-US
From: Stuart Yoder <stuart.yoder@arm.com>
In-Reply-To: <aP_Q4XCXnBw4Wv0N@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/27/25 4:06 PM, Jarkko Sakkinen wrote:
> On Fri, Oct 24, 2025 at 12:43:45PM -0500, Stuart Yoder wrote:
>> Hi Jarkko,
>>
>> I have sent a v2 of this patch that adds the missing kernel
>> doc info that triggered this warning.
>>
>> Thanks,
>> Stuart
> 
> You need to create a separate bug fix of it.

Done.  Patch is sent out.

Thanks,
Stuart
