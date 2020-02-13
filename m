Content-Type: multipart/mixed; boundary="===============6761880482271736735=="
MIME-Version: 1.0
From: Quentin Perret <qperret@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 3/3] kbuild: generate autoksyms.h early
Date: Thu, 13 Feb 2020 18:07:36 +0000
Message-ID: <20200213180736.GA157895@google.com>
In-Reply-To: <20200213084251.GU12867@shao2-debian>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6761880482271736735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thursday 13 Feb 2020 at 16:42:51 (+0800), kernel test robot wrote:
> I attached the build log for your reference.

Thanks!

<snip>
> scripts/kconfig/conf  --syncconfig Kconfig
>   SYSTBL  arch/x86/include/generated/asm/syscalls_32.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_32.h
>   UPD     include/config/kernel.release
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_64.h
>   SYSHDR  arch/x86/include/generated/uapi/asm/unistd_x32.h
>   UPD     include/generated/utsrelease.h
>   HOSTCC  scripts/dtc/dtc.o
>   HOSTCC  scripts/dtc/flattree.o
> ./scripts/gen_autoksyms.sh: 24: ./scripts/gen_autoksyms.sh: [[: not found
> ./scripts/gen_autoksyms.sh: 35: ./scripts/gen_autoksyms.sh: [[: not found
> cat: /home/nfs/linux//dev/null: No such file or directory

OK, so that's the issue, which Nicolas pointed out earlier. That should
be fixed in v4.

Thanks,
Quentin
--===============6761880482271736735==--

