Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AD063D0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jan 2023 15:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673710851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Dh6yk8csr/eZOUlGPWXMleDNuQ9Z9V+cukaxPF1gRvo=;
	b=F/l8Uc2bZ4z3x+n+eNaQ6SaFZ6Hf/M+Tdz7g/FJ2jyc/rSOqpknOQRYnoOk+PbtO+rtlzE
	5gDJbawsTORulZsGdvKVWX+6F05omDlTVJew1ki4wW7YzT373h0RHCXzKczHZcbGqfrGg5
	qLhNNvI7TRrlLai/eIikMnKXFPE1IC4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-448-ZNouPjXQOIit_s1dmua2Zg-1; Sat, 14 Jan 2023 10:40:50 -0500
X-MC-Unique: ZNouPjXQOIit_s1dmua2Zg-1
Received: by mail-wm1-f69.google.com with SMTP id az37-20020a05600c602500b003da50af44b3so680166wmb.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Jan 2023 07:40:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dh6yk8csr/eZOUlGPWXMleDNuQ9Z9V+cukaxPF1gRvo=;
        b=UMnOtT55QCBBI3UfeQh8Q08gpVU/OwLjYkGuJ0hsp+lNmVP3qelxIba4Tb0mX3obdQ
         yuTBKCzXKRaPyJ9yCm12T2FFUugTFKY3HoLmJPcmf81PL7iEnk3lC8DAAKAMlf+fQV+l
         s6RH9fZTHqjEnboBkgTTXtSkYgYDLlPSkY7CLzJYzYPmgZdBAtrdTgTl+DJu617R04uH
         Ue2Mnhi1QQXFf7OlxEUlLq/OJCrjD46lvBhnb4ZgbcfpTpmgGy6UaWBetFUgmZBfgsZR
         aeBG9+Coz7ANfWclXccl5+Vaq/mlKCqTZeV1vnCgcnVKrAyugZ2pOLmgtjmH85tVDAJd
         F2yg==
X-Gm-Message-State: AFqh2kqpSx+RDVo3zYK3QCvXhgdifouy5oWr0cAoVosx8Xsl1UYGwaz1
	1Dr2gsaAXOWs4yjdx+fywSEdDzaYlT6l8NA972kMuqjaOBFrXsd78b2DH44pj7Gepvo0UQFO0Kq
	c3YsRZzpTlbbYYZ9a4YELo/40aQ==
X-Received: by 2002:a05:6000:1d85:b0:2b9:28ef:24c9 with SMTP id bk5-20020a0560001d8500b002b928ef24c9mr21986057wrb.39.1673710848943;
        Sat, 14 Jan 2023 07:40:48 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu11GTxdPU/EOBPWTgZb5Vo4ySk9KQCFWhbgHRJPpaULXx6BHZskGmeenEYtcqPpNfcGMHn6w==
X-Received: by 2002:a05:6000:1d85:b0:2b9:28ef:24c9 with SMTP id bk5-20020a0560001d8500b002b928ef24c9mr21986046wrb.39.1673710848590;
        Sat, 14 Jan 2023 07:40:48 -0800 (PST)
Received: from ?IPV6:2003:cb:c71c:9800:fa4a:c1fc:a860:85af? (p200300cbc71c9800fa4ac1fca86085af.dip0.t-ipconnect.de. [2003:cb:c71c:9800:fa4a:c1fc:a860:85af])
        by smtp.gmail.com with ESMTPSA id w6-20020adfd4c6000000b0027cb20605e3sm21342013wrk.105.2023.01.14.07.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jan 2023 07:40:48 -0800 (PST)
Message-ID: <84c33e13-3a07-b356-5a4a-83b3886be0c3@redhat.com>
Date: Sat, 14 Jan 2023 16:40:47 +0100
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [ammarfaizi2-block:akpm/mm/mm-unstable 289/353]
 mm/debug_vm_pgtable.c:814:43: error: implicit declaration of function
 'generic_max_swapfile_size'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ammar Faizi <ammarfaizi2@gnuweeb.org>,
 GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202301141908.5CL5Toth-lkp@intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <202301141908.5CL5Toth-lkp@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14.01.23 12:24, kernel test robot wrote:
> tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
> head:   b62e8196de8602c16d6ea10807d147b480db2712
> commit: 2234b0437c6fa63c611df1032c614464957e9262 [289/353] mm/debug_vm_pgtable: more pte_swp_exclusive() sanity checks
> config: x86_64-randconfig-a013
> compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
> reproduce (this is a W=1 build):
>          # https://github.com/ammarfaizi2/linux-block/commit/2234b0437c6fa63c611df1032c614464957e9262
>          git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
>          git fetch --no-tags ammarfaizi2-block akpm/mm/mm-unstable
>          git checkout 2234b0437c6fa63c611df1032c614464957e9262
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          make W=1 O=build_dir ARCH=x86_64 olddefconfig
>          make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     mm/debug_vm_pgtable.c: In function 'pte_swap_exclusive_tests':
>>> mm/debug_vm_pgtable.c:814:43: error: implicit declaration of function 'generic_max_swapfile_size' [-Werror=implicit-function-declaration]
>       814 |         unsigned long max_swapfile_size = generic_max_swapfile_size();
>           |                                           ^~~~~~~~~~~~~~~~~~~~~~~~~
>     cc1: some warnings being treated as errors

Triggers without CONFIG_SWAP. Will send a fixup.

-- 
Thanks,

David / dhildenb

