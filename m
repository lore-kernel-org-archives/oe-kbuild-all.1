Content-Type: multipart/mixed; boundary="===============2630850614047616594=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 10/11] module: Reorder functions
Date: Fri, 07 Feb 2020 06:15:49 +0800
Message-ID: <202002070625.QnRvE6jG%lkp@intel.com>
In-Reply-To: <20200205223950.1212394-11-kristen@linux.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2630850614047616594==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Kristen,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/x86/core]
[also build test ERROR on kbuild/for-next tip/x86/mm v5.5]
[cannot apply to linus/master next-20200206]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Kristen-Carlson-Accardi/Fi=
ner-grained-kernel-address-space-randomization/20200207-030617
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 248ed51=
048c40d36728e70914e38bffd7821da57
config: arc-defconfig (attached as .config)
compiler: arc-elf-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # save the attached .config to linux build tree
        GCC_VERSION=3D9.2.0 make.cross ARCH=3Darc =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/module.c: In function 'randomize_text':
>> kernel/module.c:3292:39: error: implicit declaration of function 'kaslr_=
enabled' [-Werror=3Dimplicit-function-declaration]
    3292 |  if (!IS_ENABLED(CONFIG_FG_KASLR) || !kaslr_enabled())
         |                                       ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/kaslr_enabled +3292 kernel/module.c

  3276	=

  3277	/*
  3278	 * randomize_text()
  3279	 * Look through the core section looking for executable code section=
s.
  3280	 * Store sections in an array and then shuffle the sections
  3281	 * to reorder the functions.
  3282	 */
  3283	static void randomize_text(struct module *mod, struct load_info *inf=
o)
  3284	{
  3285		int i;
  3286		int num_text_sections =3D 0;
  3287		Elf_Shdr **text_list;
  3288		int size =3D 0;
  3289		int max_sections =3D info->hdr->e_shnum;
  3290		unsigned int sec =3D find_sec(info, ".text");
  3291	=

> 3292		if (!IS_ENABLED(CONFIG_FG_KASLR) || !kaslr_enabled())
  3293			return;
  3294	=

  3295		if (sec =3D=3D 0)
  3296			return;
  3297	=

  3298		text_list =3D kmalloc_array(max_sections, sizeof(*text_list), GFP_K=
ERNEL);
  3299		if (text_list =3D=3D NULL)
  3300			return;
  3301	=

  3302		for (i =3D 0; i < max_sections; i++) {
  3303			Elf_Shdr *shdr =3D &info->sechdrs[i];
  3304			const char *sname =3D info->secstrings + shdr->sh_name;
  3305	=

  3306			if (!(shdr->sh_flags & SHF_ALLOC) ||
  3307			    !(shdr->sh_flags & SHF_EXECINSTR) ||
  3308			    strstarts(sname, ".init"))
  3309				continue;
  3310	=

  3311			text_list[num_text_sections] =3D shdr;
  3312			num_text_sections++;
  3313		}
  3314	=

  3315		shuffle_text_list(text_list, num_text_sections);
  3316	=

  3317		for (i =3D 0; i < num_text_sections; i++) {
  3318			Elf_Shdr *shdr =3D text_list[i];
  3319			unsigned int infosec;
  3320			const char *sname;
  3321	=

  3322			sname =3D info->secstrings + shdr->sh_name;
  3323			infosec	=3D shdr->sh_info;
  3324	=

  3325			shdr->sh_entsize =3D get_offset(mod, &size, shdr, infosec);
  3326		}
  3327	=

  3328		kfree(text_list);
  3329	}
  3330	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============2630850614047616594==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
KIoAAA==
--===============2630850614047616594==--

