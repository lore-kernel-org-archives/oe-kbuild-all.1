Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090AE287277
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 09:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753782798; cv=none; b=JC67klykde652A/yDhSQgjO4742jYjtSvMRW2VQ9CMKhVv1fI38DU+mYAG34o4JLfHWlc6SzzgMGm0cR9i6zKKLtoShknA/1zLn0BkCK4LINFRr0zmcTficodqWiZcvdT2kavIcaY8a2cfg13aI99aGCxmvNI6AzN5qBliEyGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753782798; c=relaxed/simple;
	bh=rlndRviMl0UcHdaxHRoggsqdCQNzmSzMZrAcRGb5hqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIftiBEKeCOebATaGrDz4g9CXzEyqphXQPf7uK4mQ8Qlm0bDz4q7qACQ3m8bHBA5KulZ49fvqnxpbo+Mlj8t82cmoHnnovXEEkU3SXfM9g+N/G0CLZR3LjChIUgKv26/ZspMPYqLt6dKz/ySt+qfvqeBSis+Au37id014w8QzxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOU7lziM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOU7lziM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45619d70c72so5864895e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 02:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753782795; x=1754387595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EE9S7KbhSao+VXArHjxBh/cgveFNCFgRdGsc9h/clf8=;
        b=bOU7lziMhMWjF74Rw8lG6TPlNep0Vh9tUe/MW65hWUHGE9J3Lm0xhHtH844ngpgQ7+
         uQrvLQ48saJOtSS+WO71iHQ9Uk6zLMG3qeY2rv8Esa5o2bsGgirTNo7IAZb6zNGovXUx
         ZdotLzd47rlGPTOvJvOYXuPhyqi00SvaaoI8IfGo01VOM6mOvNeYOE13uhz8h11BUwWN
         Rd4Ee1s6JHTQgv1XBnQXKycQkG4qPmg0JgdvlipaLm3hZ1hFqQ5Scv7ZUn9lbfBdhrM2
         l7kxiMe0SjEZiEXNpRKxrX5qQbNIxoFz8IDtLRbXfW23Xp5auU11HG8MEhgUlhn5vnJE
         PNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753782795; x=1754387595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EE9S7KbhSao+VXArHjxBh/cgveFNCFgRdGsc9h/clf8=;
        b=M6IjyCptqOBngBEgGqoyrYMBn71txeH6zvqChPEds6NAe9LKF+al4ufaIFql/7x+QV
         /dkRNocFRH+GlB/1x10mzcaq8e7LsJND+oqWWNi/OG01+EYaUvxAue/QuEr5usGds8no
         fPNN4ErXoJy3kZ9ddDFG7UXhjvP7Sp+rGzVKCkkgLIwK2Lq8z4bxFb8z/YXcJ6x7SNjo
         nV45UbzAE3mZIH7gj1qYOV1SiFQSrMqVDJnm7w6sDCKH+xCWKU8MbIZbdvZVgQB0pU1g
         Chthf60HTEgsFxbmHB+eZyz3I13QzaWo5NMaUP+5kvHTtenV9vwkvpP6YA5BtDbXmu+J
         BisA==
X-Forwarded-Encrypted: i=1; AJvYcCU80I0JlOh2kp74ozK1L7SzZsXNRSg1swN6aXOXV/0TNNTFEVfbFEkKMnacnXlSGqsNNX/8P2CFpIUaudRM@lists.linux.dev
X-Gm-Message-State: AOJu0YzbzFgHTEOhxqCK1WR5OB6NC6wnUBKDjja9i2swbEjKCDXc3E9t
	+J38KOaS86TOXxSwusrCg4pIhvokQ1goiW5TKk2eJOohNaIfYusik0wgMncYY4fT
X-Gm-Gg: ASbGnctvMDpsZ+t1pWkPSKyJd01zbGg885KbSwqgM8LyaVugsbKdj7VuRL3yi2qfWLl
	7bSsDzzZ3b5whjpvgox8kWV/v777iSGmq+nIGdSgng0gIyU9JngRq+Ci5JBo2LearGDwWFt5eD+
	4P9GMO5gFJdDH0+m2ba1adg41mogebhbMVFVubnHTFFoF/vBUaDkXyo5hA5uFxPrnHocuxs3c9M
	vHMBV9PMNJoWSWy5q6cRF/2ZmW/Xb9/CMJPCBwKahsSzBmh4bNNg5XAImABD+2MTDyKIGTML8Rl
	VylwwRIwwqDk4M78oFAWujXnTm2JV8ItHSkmOHFY4wsdHP7ueiycHWUYjf7iDeCfWNKdZs0Sl78
	H74yAFpPopFhRMCrcrTTRCdBjkIpt+BnHRklM1C8dehGzZn2V68eyUsg=
X-Google-Smtp-Source: AGHT+IGZrlB2YEoAZYXWNimrkcTKG3bFP6Bf59CEiAeLziQfIZ6sdzcDPoKMp80H8l0VyK0C7TQmsQ==
X-Received: by 2002:a05:6000:240b:b0:3a5:1388:9a55 with SMTP id ffacd0b85a97d-3b78e3d5ac2mr2135420f8f.5.1753782795107;
        Tue, 29 Jul 2025 02:53:15 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705bcb96sm196872745e9.21.2025.07.29.02.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 02:53:14 -0700 (PDT)
Date: Tue, 29 Jul 2025 11:53:11 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Martin KaFai Lau <martin.lau@linux.dev>
Cc: alexei.starovoitov@gmail.com, andrii@kernel.org, ast@kernel.org,
	bpf@vger.kernel.org, coreteam@netfilter.org, daniel@iogearbox.net,
	fw@strlen.de, john.fastabend@gmail.com, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	pablo@netfilter.org, lkp@intel.com
Subject: Re: [PATCH bpf-next v3 0/4] bpf: add icmp_send_unreach kfunc
Message-ID: <aIiaB2QUxKmhvPlx@gmail.com>
References: <202507270940.kXGmRbg5-lkp@intel.com>
 <20250728094345.46132-1-mahe.tardy@gmail.com>
 <b36532a2-506b-4ba5-b6a3-a089386a190e@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b36532a2-506b-4ba5-b6a3-a089386a190e@linux.dev>

On Mon, Jul 28, 2025 at 06:21:50PM -0700, Martin KaFai Lau wrote:
> On 7/28/25 2:43 AM, Mahe Tardy wrote:
> > Hello,
> > 
> > This is v3 of adding the icmp_send_unreach kfunc, as suggested during
> > LSF/MM/BPF 2025[^1]. The goal is to allow cgroup_skb programs to
> > actively reject east-west traffic, similarly to what is possible to do
> > with netfilter reject target.
> > 
> > The first step to implement this is using ICMP control messages, with
> > the ICMP_DEST_UNREACH type with various code ICMP_NET_UNREACH,
> > ICMP_HOST_UNREACH, ICMP_PROT_UNREACH, etc. This is easier to implement
> > than a TCP RST reply and will already hint the client TCP stack to abort
> > the connection and not retry extensively.
> > 
> > Note that this is different than the sock_destroy kfunc, that along
> > calls tcp_abort and thus sends a reset, destroying the underlying
> > socket.
> > 
> > Caveats of this kfunc design are that a cgroup_skb program can call this
> > function N times, thus send N ICMP unreach control messages and that the
> > program can return from the BPF filter with SK_PASS leading to a
> > potential confusing situation where the TCP connection was established
> > while the client received ICMP_DEST_UNREACH messages.
> > 
> > Another more sophisticated design idea would be for the kfunc to set the
> > kernel to send an ICMP_HOST_UNREACH control message with the appropriate
> > code when the cgroup_skb program terminates with SK_DROP. Creating a new
> > 'SK_REJECT' return code for cgroup_skb program was generally rejected
> > and would be too limited for other program types support.
> > 
> > We should bear in mind that we want to add a TCP reset kfunc next and
> > also could extend this kfunc to other program types if wanted.
> 
> Some high level questions.
> 
> Which other program types do you need this kfunc to send icmp and the future
> tcp rst?

I don't really know, I mostly need this in cgroup_skb for my use case
but I could see other programs type using this either for simplification
(for progs that can already rewrite the packet, like tc) or other
programs types like cgroup_skb, because they can't touch the packet
themselves.

> 
> This cover letter mentioned sending icmp unreach is easier than sending tcp
> rst. What problems do you see in sending tcp rst?
> 

Yes, I based these patches on what net/ipv4/netfilter/ipt_REJECT.c's
'reject_tg' function does. In the case of sending ICMP unreach
'nf_send_unreach', the routing step is quite straighforward as they are
only inverting the daddr and the saddr (that's what my renamed/moved
ip_route_reply_fetch_dst helper does).

In the case of sending RST 'nf_send_reset', there are extra steps, first
the same routing mechanism is done by just inverting the daddr and the
saddr but later 'ip_route_me_harder' is called which is doing a lot
more. I'm currently not sure which parts of this must be ported to work
in our BPF use case so I wanted to start with unreach.
