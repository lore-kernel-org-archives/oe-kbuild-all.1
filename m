Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A7B28541C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 23:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753831692; cv=none; b=P5EgcS+1FR+zbvelW817lvcU62aour/O6OYLee1FTlr5NYndkmxQYVmOE3XF9IGP8zS6d4dotxxk46MnyOI4sLR2noboc+QM6QdxZRxH6dL9QXlomhiVNzluDiuS3LaUBI2rFuFPcBoEAGruvJ1VP8CfRo3cBUCmpDbRYxFaY0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753831692; c=relaxed/simple;
	bh=QOJYG+Uqmdy6u2HwLhbuwUtA5doc1ovpHrwdcomieCk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lTjTGIYQMQsv9/dqXafVhU+dlxZjpmjy3WGMrLjRV6B20iG64gT+b57C20lSX31cFXYigJCyv3DoO+5uaI3sjg5vnlAK2qJUDfeGrLWxdVm8tydfbt1T2eWGP2nRWBHyxlexHzh0KIxk1NCS8X5rHPLdT1YJh0SSy9U3tED1V0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f7g6+z49; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f7g6+z49"
Message-ID: <996bb1dd-e72e-4515-a60f-c5f31b840459@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753831688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=koTrP2VFNtdvtaIt/kUv8hV8F56uZXeKg2Yo219B928=;
	b=f7g6+z49wPWRrvx17RGjj8F+kbO/QBwM26Vk5EjKz/Xz/bm/VJCyCMj0l+yp40MU0dZWuG
	3lkV8kqTAtwrOdcBXOZWRjmjDgzPNwKpqveKd6KCCMDmdrARMzY6ApL0SSBeg8pizGmPj9
	RZXRxbd8IA7/PndWtOM3ENEy7PRTsPA=
Date: Tue, 29 Jul 2025 16:27:40 -0700
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 4/4] selftests/bpf: add icmp_send_unreach
 kfunc tests
To: Mahe Tardy <mahe.tardy@gmail.com>
Cc: alexei.starovoitov@gmail.com, andrii@kernel.org, ast@kernel.org,
 bpf@vger.kernel.org, coreteam@netfilter.org, daniel@iogearbox.net,
 fw@strlen.de, john.fastabend@gmail.com, netdev@vger.kernel.org,
 netfilter-devel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 pablo@netfilter.org, lkp@intel.com
References: <202507270940.kXGmRbg5-lkp@intel.com>
 <20250728094345.46132-1-mahe.tardy@gmail.com>
 <20250728094345.46132-5-mahe.tardy@gmail.com>
 <382ff228-704c-4e0c-9df3-2eb178adcba8@linux.dev> <aIiP5l24ihrS2x-u@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Martin KaFai Lau <martin.lau@linux.dev>
In-Reply-To: <aIiP5l24ihrS2x-u@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 7/29/25 2:09 AM, Mahe Tardy wrote:
> On Mon, Jul 28, 2025 at 06:18:11PM -0700, Martin KaFai Lau wrote:
>> On 7/28/25 2:43 AM, Mahe Tardy wrote:
>>> +SEC("cgroup_skb/egress")
>>> +int egress(struct __sk_buff *skb)
>>> +{
>>> +	void *data = (void *)(long)skb->data;
>>> +	void *data_end = (void *)(long)skb->data_end;
>>> +	struct iphdr *iph;
>>> +	struct tcphdr *tcph;
>>> +
>>> +	iph = data;
>>> +	if ((void *)(iph + 1) > data_end || iph->version != 4 ||
>>> +	    iph->protocol != IPPROTO_TCP || iph->daddr != bpf_htonl(SERVER_IP))
>>> +		return SK_PASS;
>>> +
>>> +	tcph = (void *)iph + iph->ihl * 4;
>>> +	if ((void *)(tcph + 1) > data_end ||
>>> +	    tcph->dest != bpf_htons(SERVER_PORT))
>>> +		return SK_PASS;
>>> +
>>> +	kfunc_ret = bpf_icmp_send_unreach(skb, unreach_code);
>>> +
>>> +	/* returns SK_PASS to execute the test case quicker */
>>
>> Do you know why the user space is slower if 0 (SK_DROP) is used?
> 
> I tried to write my understanding of this in the commit description:
> 
> "Note that the BPF program returns SK_PASS to let the connection being
> established to finish the test cases quicker. Otherwise, you have to
> wait for the TCP three-way handshake to timeout in the kernel and
> retrieve the errno translated from the unreach code set by the ICMP
> control message."

This feels like a bit hacky to let the 3WHS finished while the objective of the 
patch set is to drop it. It is not unusual for people to directly borrow this 
code. Does non blocking connect() help?
