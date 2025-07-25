Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F044D1E4BE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Jul 2025 03:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753413540; cv=none; b=FYrHITaFZnF6MGXZ9aaDW5MM+y1pLfdeSPl4yNvUqfoWeB4IIxcfNX67ara5rwGW9d+TGTjRqeTBjKvSUjxpRamc2UP7yzc3xWDs57wbeo/PPmdg2CzOaBB16zkGpK4OISAWXDe6CvGc5zwoBvzcbuGcm8x4LYtGeoDGDoch/Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753413540; c=relaxed/simple;
	bh=TEqYYAEow7cTJWGY/Qg3LDgEzrccaNSe6l7CjMXk+Ko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ah29puCTJzV5jWyLYgbG9rny0nQymljmHOfoC48+G4MMgpOMEp8w2r/omys5EJRrSNlswBVGBnk0LcZkF4qpMYO+Nv+Adda6Pu2XB4ToIyjvYEYVFlFnWWU+UE7p6lT1avG9eBtLODShMDNwcux0tjK/d/jrL+I6HEegOtt6lp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Sb6DQB5K; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Sb6DQB5K"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1753413530; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+cenDW8BUZ7NZFo6zkJ0qfqRUtzCEhoXkgxlwGs3dvY=;
	b=Sb6DQB5KYvRVyKvgeAowFSjW6tDVJQt3wbOQDrazP7mog7eOzJaT4ozMhlbePUDxG+R3o3KXG+YBEx6h1MRTK1RwmI9yo5ICz0xlXZdOBPsCC+IVMugDrRhiE633QxRfHxCxlPQy552osUT7j6uPudSU0pkQt0Do512oxKcoBPA=
Received: from 30.246.181.19(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WjvNXY._1753413526 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 25 Jul 2025 11:18:47 +0800
Message-ID: <df38380f-c546-4de8-b228-9b1db319545a@linux.alibaba.com>
Date: Fri, 25 Jul 2025 11:18:45 +0800
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/2] PCI: trace: Add a RAS tracepoint to monitor link
 speed changes
To: Steven Rostedt <rostedt@goodmis.org>
Cc: kernel test robot <lkp@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 lukas@wunner.de, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-edac@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 helgaas@kernel.org, ilpo.jarvinen@linux.intel.com, mattc@purestorage.com,
 Jonathan.Cameron@huawei.com, oe-kbuild-all@lists.linux.dev,
 tony.luck@intel.com, bp@alien8.de, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, oleg@redhat.com, naveen@kernel.org,
 davem@davemloft.net, anil.s.keshavamurthy@intel.com, mark.rutland@arm.com,
 peterz@infradead.org, tianruidong@linux.alibaba.com
References: <20250723033108.61587-3-xueshuai@linux.alibaba.com>
 <202507240322.nJGdyXsy-lkp@intel.com>
 <20250724100659.697b5972@batman.local.home>
 <4b41e3e2-ebac-48c3-b1a3-ce24a5bed475@linux.alibaba.com>
 <20250724225752.42af5c45@gandalf.local.home>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250724225752.42af5c45@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/7/25 10:57, Steven Rostedt 写道:
> On Fri, 25 Jul 2025 10:31:45 +0800
> Shuai Xue <xueshuai@linux.alibaba.com> wrote:
> 
>> I'm leaning toward option 1 (dedicated trace.c file) as it's the
>> cleanest approach and follows the pattern used in other subsystems. Does
>> that sound reasonable to you?
> 
> That's fine, but make sure you have #ifdef CONFIG_FOO around tracepoints
> that are only used when those configs are enabled, otherwise you will get
> warnings.
> 
> Well, if they are exported, then the warnings are suppressed.
> 
>    https://lore.kernel.org/all/20250725025149.726267838@kernel.org/
> 
> -- Steve

Hi Steve,

Got it. Thanks for the important reminder about the CONFIG guards!

Best regards,
Shuai
