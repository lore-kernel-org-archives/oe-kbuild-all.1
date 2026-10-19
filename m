Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792445036;
	b=yQnEV41jInuFgyRU8Pn+0ca3gdZqcYvzeM2WOeJINOt14kSXX3QcT7v0+mg3FaS6COv3
	 nLVe8okHMoiccn7v2JDJn7BtnuOsaLLTrcIaAaEy9XRlH0OOYDbrqis0l3V8RnonUKouW
	 Fq7mQTqyACD/luJjalB4tUL3ttjm7EkbkPAyGYdDXslsn6nFdPezl1G2vciglkQj7hO5k
	 IftRXpG2JyRIE1TnVnE+qM3OUSqMwj6QPnvvllW48jwmuVYfrTYWlNZlVMN+tWW5jxoZu
	 Zy5+7+5QNVFA1lAaR+WsWdilrXlsCzAM2/H3Bua9yjtGyvqC8KUGspYG/RY1qJVOpXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792445036;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=RaSAtodmC/zEZWFNfit/fgpW8kKnO7aYgRQp3aEBxrU=;
	b=u+Q26Lfq84jvbxqipJLrBeioLlnZvR1uBMO4WEe9NFB8tWVaxZe4L8NV/yZw4bLMuZ6K
	 Db8y8oypfIXp3GKyvjLU/uqpYGhi5N/94hk2OVn2z6UhkazFefUU7fuC3c5N4lXMUqh/Q
	 LsSmbBoe6+BADuFEECgQv3yxa4ollA7N0AnsFU8XB2jfQGIbIFxEd8QNvojR2A+zRg98L
	 HcbKE4+rJU7NViMPpq/UAINfD0xofJDCS6Vi/4RO1XlMjmKPexjb8lC2Z4Ipk+g9BOTXv
	 hGmL/P6E7wr8TE1kgCc99oiMcY0Y9sgcxp++UUFcUsQWR5dgEX1eXXPvQjWRP0Y02GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bvjbG3UL;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA803606A320
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 21:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA803606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bvjbG3UL
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1f403aca0so973135e9.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Oct 2026 14:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792445034; x=1793049834; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RaSAtodmC/zEZWFNfit/fgpW8kKnO7aYgRQp3aEBxrU=;
        b=bvjbG3ULgs5lVGdYLaDDB8YbgLhAE3JciWU4l09U+Z4VRPK/JK5d1Pvv8s9YARjdZt
         P6TOu/FPV255FT2bBn2fuxuYdiFM0EGHl9QKktKtCCC0vy/15/YAsFkS422PEmzX8lrb
         6bdtDzerJydkGiDSbqPXneca1K0A87IrXEUr7bMOYktEjX3OQ2id5U2fbaRo8qRh/LQK
         OmGzH5YWlIA3/S4wjyYmfJwjqbMDkfwGN5de7KhNHV9Qtj0gT4Gx77MMeyuk6sMJ1qPT
         10CH+aoBSr6oWnYqZztnHdnU7ZZTviiljOaomujnvq/VshkOQk8dkzVZw61sU2tcbH6s
         aPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792445034; x=1793049834;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RaSAtodmC/zEZWFNfit/fgpW8kKnO7aYgRQp3aEBxrU=;
        b=ZPtV0WNMIC/vXhpdjF/5i4YW/R0tdeSWAlhLlHVB8SUlSl314PBcX6jHwikVH2x0+7
         Jl4MEe176l++arwOPyGCuKku97jP/EDdL3GUws/14//JnmQwaPdqpTL6oEZ+l6cxibj5
         6K6VlEeSXCvK7amTgINbZxF5n4QlPbu6z4FuCy20ZNuRZ21hgXYR9ksXDFcI3hHAJNLE
         Q0ZyLcPgfMoJTFYwCEaz6p1DbKq86S5vuijjQj5/zQl4TQiWxzAufF6316svTtoKqixx
         VbroJ3iLhUXEWgtoekDFUPRkyG/wcKCD+gnwO16ikQX1URn2Nr1GD0IU8GvvondEtTA6
         brAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjbVphqovTK2y1KFxSD7guU0Va5uBZ/FcHod/JihfT6WO0Hb420dy730GEVeSmY5RlnnMg+PaJb+Jb84YI@lists.linux.dev
X-Gm-Message-State: AFq9FYKWVNtOTxZmeHcLaqPHQLPiQprpUev6B2LvuMOA2RrT78XX0Y13
	H20PW3Ka/2p1ORyEVt60UqsY09JaMoj4LosaBjFkSwIb9M26imf2/WOp
X-Gm-Gg: AYBFou1SrIbv4No00JcaWttfpGsDSAJaf6PqIcmo05err2YZ2zUzquuIdSKgF33D3rc
	+WjN6T4J1nFy77H4R2PBrYJqoTXQy108ZoH604esNYvk/9bNk+1kBcVR8M6EzrIp2TJKbeSKnsU
	HtTc1TtUsycILlfK5HQ5xP3cYXxvJAQDfYMfQiLuJTMqX7K/CuAXxP0xirOaJ7xQ1bp3u0/tiz5
	JBtEZqZoC7mwaF8mzy7GCWJ1BzKW4jSzSoGmBtHPYEW2O/CamfhQ1lUsKZcwhrym0XLKcdjvzc6
	BHfmAVEYqFjGHx5f9wM9K0Ytf44hcogcWH9Ngex3ZOmCiXprC6MNgekzoudVBhdpTNLpzT140yi
	ncXv4PGMVX0JmwZZHX4ViwlSbjeaA8Kkz+YcH+XZTebjPyWrsdAaOxHldgBT82ezDHgk+k5ms+i
	yIRuhPIBtm7+lNwCGv/r+NiPepDLz7IVY8hMD5yM7bBx8pdSE9k9RzsPKmCMUZba6DBGmeyqvoa
	OCYB9IAF+UIORCXfMCOa+zcDKD7sa2d5QOnkjLN30J6Og==
X-Received: by 2002:a05:600c:e549:20b0:4a1:811c:8078 with SMTP id 5b1f17b1804b1-4a1d7624601mr116807835e9.26.1792445034012;
        Mon, 19 Oct 2026 14:23:54 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e2def9ecsm97956265e9.1.2026.10.19.14.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 14:23:53 -0700 (PDT)
Date: Mon, 19 Oct 2026 22:23:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek
 <pmladek@suse.com>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, Lorenzo Stoakes
 <ljs@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Andrey Grodzovsky <andrey.grodzovsky@crowdstrike.com>,
 Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 14/15] kallsyms: scripts/kallsyms: Reduce the output
 file size
Message-ID: <20261019222351.64bb9d35@pumpkin>
In-Reply-To: <202610200336.6v4SE96n-lkp@intel.com>
References: <20261018155206.132411-15-david.laight.linux@gmail.com>
	<202610200336.6v4SE96n-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 20 Oct 2026 03:50:35 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi David,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on akpm-mm/mm-everything]
> [also build test WARNING on linus/master v7.3]
> [cannot apply to next-20261016 next-20261016]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/kallsyms-scripts-kallsyms-c-Avoid-overrunning-on-stack-buffer/20261018-165152
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20261018155206.132411-15-david.laight.linux%40gmail.com
> patch subject: [PATCH 14/15] kallsyms: scripts/kallsyms: Reduce the output file size
> config: um-allmodconfig (https://download.01.org/0day-ci/archive/20261020/202610200336.6v4SE96n-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200336.6v4SE96n-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610200336.6v4SE96n-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> scripts/kallsyms.c:371:26: warning: adding 'int' to a string does not append to the string [-Wstring-plus-int]  
>      371 |                         printf("\n\t.short\t" + !i);
>          |                                ~~~~~~~~~~~~~~~^~~~
>    scripts/kallsyms.c:371:26: note: use array indexing to silence this warning

Hmmm it gives the same error for (!i + "string") even though that doesn't even look
like a broken attempt to append to the string.


>      371 |                         printf("\n\t.short\t" + !i);
>          |                                               ^   
>          |                                &              [   ]
> >> scripts/kallsyms.c:371:11: warning: format string is not a string literal (potentially insecure) [-Wformat-security]  
>      371 |                         printf("\n\t.short\t" + !i);
>          |                                ^~~~~~~~~~~~~~~~~~~

The compiler ought to do better there...
Indeed, gcc does.

...
>    366		output_label("kallsyms_token_index");
>    367		for (i = 0; i < 256; i++) {
>    368			if (i & 15)
>    369				printf(",");
>    370			else
>  > 371				printf("\n\t.short\t" + !i);  
>    372			printf("%u", best_idx[i]);
>    373		}

I knew I should have interleaved putchar() and fputs() with the printf().
They are somewhat faster - in this file it is measurable.
gcc does convert printf() to putchar() or puts() but not fputs().

The time taken to write the files halves if I initialise an array with all the
",%u" values and use fputs(str[byte_val] + !comma).
I decided someone would object to the mess.

I'll think of something for v3.

David

