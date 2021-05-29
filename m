Content-Type: multipart/mixed; boundary="===============3524813310410975804=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [mkp-scsi:for-next 100/112] drivers/scsi/arm/fas216.c:2056:20: warning: incompatible integer to pointer conversion passing 'int' to parameter of type 'struct scsi_cmnd *'
Date: Sat, 29 May 2021 18:53:07 +0800
Message-ID: <202105291803.ou0OroWo-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3524813310410975804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-ne=
xt
head:   46ded13dd3821d96fee65f0cef4bd8f0184607ab
commit: 8f8713fab638d1a1dc5e5525cb307068b26a2c84 [100/112] scsi: fas216: Tr=
anslate message to host byte status
config: arm-randconfig-r036-20210528 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 6505c6=
30407c5feec818f0bb1c284f9eeebf2071)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git/comm=
it/?id=3D8f8713fab638d1a1dc5e5525cb307068b26a2c84
        git remote add mkp-scsi https://git.kernel.org/pub/scm/linux/kernel=
/git/mkp/scsi.git
        git fetch --no-tags mkp-scsi for-next
        git checkout 8f8713fab638d1a1dc5e5525cb307068b26a2c84
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/scsi/arm/fas216.c:2056:20: warning: incompatible integer to poin=
ter conversion passing 'int' to parameter of type 'struct scsi_cmnd *' [-Wi=
nt-conversion]
           if (get_host_byte(SCpnt->result) !=3D DID_OK)
                             ^~~~~~~~~~~~~
   include/scsi/scsi_cmnd.h:333:50: note: passing argument to parameter 'cm=
d' here
   static inline u8 get_host_byte(struct scsi_cmnd *cmd)
                                                    ^
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   1 warning generated.
   /tmp/fas216-6042e7.s: Assembler messages:
   /tmp/fas216-6042e7.s:517: Error: selected processor does not support `ld=
rsb r0,[sp,#17]' in ARM mode
   /tmp/fas216-6042e7.s:2055: Error: selected processor does not support `l=
drh r1,[r7,#172]' in ARM mode
   /tmp/fas216-6042e7.s:2091: Error: selected processor does not support `l=
drh r3,[r7,#172]' in ARM mode
   /tmp/fas216-6042e7.s:4861: Error: selected processor does not support `l=
drh r0,[r7,#172]' in ARM mode
   /tmp/fas216-6042e7.s:4895: Error: selected processor does not support `l=
drh r1,[r7,#172]' in ARM mode
   clang-13: error: assembler command failed with exit code 1 (use -v to se=
e invocation)
--
>> drivers/scsi/arm/fas216.c:2056:20: warning: incompatible integer to poin=
ter conversion passing 'int' to parameter of type 'struct scsi_cmnd *' [-Wi=
nt-conversion]
           if (get_host_byte(SCpnt->result) !=3D DID_OK)
                             ^~~~~~~~~~~~~
   include/scsi/scsi_cmnd.h:333:50: note: passing argument to parameter 'cm=
d' here
   static inline u8 get_host_byte(struct scsi_cmnd *cmd)
                                                    ^
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   'arm7m' is not a recognized processor for this target (ignoring processo=
r)
   1 warning generated.
   /tmp/fas216-c82b53.s: Assembler messages:
   /tmp/fas216-c82b53.s:517: Error: selected processor does not support `ld=
rsb r0,[sp,#17]' in ARM mode
   /tmp/fas216-c82b53.s:2055: Error: selected processor does not support `l=
drh r1,[r7,#172]' in ARM mode
   /tmp/fas216-c82b53.s:2091: Error: selected processor does not support `l=
drh r3,[r7,#172]' in ARM mode
   /tmp/fas216-c82b53.s:4861: Error: selected processor does not support `l=
drh r0,[r7,#172]' in ARM mode
   /tmp/fas216-c82b53.s:4895: Error: selected processor does not support `l=
drh r1,[r7,#172]' in ARM mode
   clang-13: error: assembler command failed with exit code 1 (use -v to se=
e invocation)


vim +2056 drivers/scsi/arm/fas216.c

  2031	=

  2032	/**
  2033	 * fas216_std_done - finish processing of standard command
  2034	 * @info: interface that completed
  2035	 * @SCpnt: command that completed
  2036	 * @result: driver byte of result
  2037	 *
  2038	 * Finish processing of standard command
  2039	 */
  2040	static void
  2041	fas216_std_done(FAS216_Info *info, struct scsi_cmnd *SCpnt, unsigned=
 int result)
  2042	{
  2043		info->stats.fins +=3D 1;
  2044	=

  2045		set_host_byte(SCpnt, result);
  2046		if (result =3D=3D DID_OK)
  2047			scsi_msg_to_host_byte(SCpnt, info->scsi.SCp.Message);
  2048		set_status_byte(SCpnt, info->scsi.SCp.Status);
  2049	=

  2050		fas216_log_command(info, LOG_CONNECT, SCpnt,
  2051			"command complete, result=3D0x%08x", SCpnt->result);
  2052	=

  2053		/*
  2054		 * If the driver detected an error, we're all done.
  2055		 */
> 2056		if (get_host_byte(SCpnt->result) !=3D DID_OK)
  2057			goto done;
  2058	=

  2059		/*
  2060		 * If the command returned CHECK_CONDITION or COMMAND_TERMINATED
  2061		 * status, request the sense information.
  2062		 */
  2063		if (status_byte(SCpnt->result) =3D=3D CHECK_CONDITION ||
  2064		    status_byte(SCpnt->result) =3D=3D COMMAND_TERMINATED)
  2065			goto request_sense;
  2066	=

  2067		/*
  2068		 * If the command did not complete with GOOD status,
  2069		 * we are all done here.
  2070		 */
  2071		if (status_byte(SCpnt->result) !=3D GOOD)
  2072			goto done;
  2073	=

  2074		/*
  2075		 * We have successfully completed a command.  Make sure that
  2076		 * we do not have any buffers left to transfer.  The world
  2077		 * is not perfect, and we seem to occasionally hit this.
  2078		 * It can be indicative of a buggy driver, target or the upper
  2079		 * levels of the SCSI code.
  2080		 */
  2081		if (info->scsi.SCp.ptr) {
  2082			switch (SCpnt->cmnd[0]) {
  2083			case INQUIRY:
  2084			case START_STOP:
  2085			case MODE_SENSE:
  2086				break;
  2087	=

  2088			default:
  2089				scmd_printk(KERN_ERR, SCpnt,
  2090					    "incomplete data transfer detected: res=3D%08X ptr=3D%p len=
=3D%X\n",
  2091					    SCpnt->result, info->scsi.SCp.ptr,
  2092					    info->scsi.SCp.this_residual);
  2093				scsi_print_command(SCpnt);
  2094				set_host_byte(SCpnt, DID_ERROR);
  2095				goto request_sense;
  2096			}
  2097		}
  2098	=

  2099	done:
  2100		if (SCpnt->scsi_done) {
  2101			SCpnt->scsi_done(SCpnt);
  2102			return;
  2103		}
  2104	=

  2105		panic("scsi%d.H: null scsi_done function in fas216_done",
  2106			info->host->host_no);
  2107	=

  2108	=

  2109	request_sense:
  2110		if (SCpnt->cmnd[0] =3D=3D REQUEST_SENSE)
  2111			goto done;
  2112	=

  2113		scsi_eh_prep_cmnd(SCpnt, &info->ses, NULL, 0, ~0);
  2114		fas216_log_target(info, LOG_CONNECT, SCpnt->device->id,
  2115				  "requesting sense");
  2116		init_SCp(SCpnt);
  2117		SCpnt->SCp.Message =3D 0;
  2118		SCpnt->SCp.Status =3D 0;
  2119		SCpnt->tag =3D 0;
  2120		SCpnt->host_scribble =3D (void *)fas216_rq_sns_done;
  2121	=

  2122		/*
  2123		 * Place this command into the high priority "request
  2124		 * sense" slot.  This will be the very next command
  2125		 * executed, unless a target connects to us.
  2126		 */
  2127		if (info->reqSCpnt)
  2128			printk(KERN_WARNING "scsi%d.%c: losing request command\n",
  2129				info->host->host_no, '0' + SCpnt->device->id);
  2130		info->reqSCpnt =3D SCpnt;
  2131	}
  2132	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3524813310410975804==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICD2osGAAAy5jb25maWcAlDxLc9s4k/f5FaxM1da3h0z0sB1nt3yASFDCiCQYAJRkX1CKTCfa
0cMryZnJ9+u3Ab4AElSyc8hE3Q2gAfQbzfz+2+8eersc9+vLdrPe7X54X/NDflpf8mfvZbvL/9sL
qJdQ4eGAiD+AONoe3v75sD7tvds/huM/Bu9Pm6E3z0+HfOf5x8PL9usbjN4eD7/9/ptPk5BMpe/L
BWac0EQKvBIP7za79eGr9z0/nYHOU7P8MfD+9XV7+a8PH+DP/fZ0Op4+7Hbf9/L1dPyffHPx7m4H
t5u78eBm8HFz+5Lnm/vh/cvgy5fhZnR/8/Ipz/MvL6PBx+F/vqtWnTbLPgwMVgiXfoSS6cOPGqh+
1rTD8QD+q3CIqwHTJGvIAVTRjsa3g1EFj4LuegCD4VEUNMMjg85eC5ibweSIx3JKBTUYtBGSZiLN
hBNPkogk2EDRhAuW+YIy3kAJ+yyXlM0byCQjUSBIjKVAkwhLTplaAC7xd2+qJWLnnfPL22tzrRNG
5ziRcKs8To25EyIkThYSMdgsiYl4GI9glpqhOCWwgMBceNuzdzhe1MT16VAfRdXxvHvXjDMREmWC
OgbrTUiOIqGGlsAZWmA5xyzBkZw+EYNTExM9xciNWT31jaB9iJsGYS9c78ZY1dxHG796uoYFDq6j
bxxnFOAQZZHQ12ScUgWeUS4SFOOHd/86HA95o058iawd8Ee+IKnvZGCJhD+TnzOcYQcHPqOcyxjH
lD1KJATyZ+bEGccRmZjjtBCCyHrnty/nH+dLvm+EcIoTzIivJTpldGKIvoniM7rsx8gIL3DkxpPk
T+wLJY3GZbMAUBzORDLMcRLYmhXQGJHEBZMzghli/uzRnC0JQB9KAqC1B4aU+TiQYsYwCohptkwu
AzzJpiHX55gfnr3jS+vAav3CU+Q/SqXpDP705+bRpwzjOBUyoYnr4ir0gkZZIhB7dIy9MsynMKqy
KX6afRDr81/eZbvPvTWwfL6sL2dvvdkc3w6X7eFrc8eKTQkDJPL1HNYpqN1ru+VCTnigpMLHIHCA
FybDbZxcjF3Mc2LtkpNaVQLClakMbBUoT/8X9qfPgfmZx7tiDdt4lIAz14afEq9SzFyHzAtic3gL
hPic6zlKuXGgOqAswC64YMjHNXvlju2d1NczL/7ysG82UsH08Tv2QuYzkHVsOqyIKusegraSUDwM
PzayRRIxB5Mf4jbNuK0n3J+BIvngSOaVFPLNt/z5bZefvJd8fXk75WcNLnfkwNY2bMpolnLzesCg
+VOXU4rmJbnhlfXvgqMGGiLCpBPjh1xOwE4sSSAsY8mEOcBlbAt0SgKL2RLMgh7/U+JDUN0nzPrn
DfCC+NgxM8i/Uqr+kTHhvmOcNmSOUcon8RTEztpGJrhMuHMH4EZYHw5Oow8Fx+jPUwpSpUw7RE0u
Q1hIkgpCqns13SLcVYDB6PlIOK+E4QgZ9l/JBxyjdsjM9CTqN4phNk4z8AFWNMQCHVK4Zg/kBDAj
S0qC/kgDcD1Rhh7lCrM0wohx4PcTFwbrE0qVudd6b16xL2kKtpo8YeXWJJgy+F+MEt8ZJrSoOfzF
MAiBpCwF3wnBBjN8LZy/LwxXrgOzjATDO5OTXjNaUVY6DXaeKEmyFlBXAsugyFgnLNx4A0gpJ6vC
zxp2rLBX7d8yiYkZihseDEchnCQzJp4gDgeSWYtnkFe1foKQG7Ok1KTnZJqgKDRuTPNpAiAgSoQJ
4DMwcEYSRIzol1CZMcvxomBBgM3ymIwDgEkmiDFiHulckTzGvAuR1hnXUH0ESo0EWVjGZ5KG1Zqu
y4WL1K7b3JeKxnT21HAGUyR+69QZx58tCYonOAic+q1FTsl2cYjm7SsgcCEXMXBI/coNlelzmp9e
jqf9+rDJPfw9P0C4gMAT+SpggFy5iJuMmYrpneHHL85YMbaIi8mKGM2SWB5lk8Iqm0llnCIBCaAV
PfIITVzGEiZok8FhsymuIimn9dFkyv9EhIMtBu2i8S8Qqtgc/L3rXvgsC0OItFMES+vzR2DfLc0W
OJYBEkgl6CQkQGAF/hCvhCSyBF2HQtpfWMG3nTI3smZqEIu13HHldKx8QWHAMWtJITSOsy5Kg2ET
oMgx3NvDvbEJybM0hfQdtCeFewUbhtr5ixJQiL2Ul27ACYVp1UAZIyNW4ZCgzYuIr5zYDMv8Ofi6
LqKgh9g8jNCUd/Eh2EaMWPQIv6VlWKpobbbEZDoTXQQoN5kw8K0gPpYj1Zoco8dyf74MA7+FrU8m
07kiNxn6bJ9yqnPYdAbnuSAm6wkG3x9D0qrM3swFL1PbWZd3S4vSaVFq0cknfxiVIamOnz3x4zVv
0oGWDKg14I4kS8DZE9hODOJzfw2PVg/Du0ZnChLl3FIQDuWEnaqlyXD6abxa9eNDcPYTRoIp7qcB
uRqPrsxBVunNtTUCurgye7pCDnXXKJZaQWYhBGg4HAz6p+Njf3SVG8jU02Hfigj8RlIZ9vR03OTn
8/HUuk+VzGo2DJsKoPHo+9iGoAmoI17c2NBUg4tU3sb4IH/gXm6WEyecLEQLTtNHB7mIJq5J0uFt
F2ILp4Iqu1WUM3j3IMIm0TKGkILBMqW2pwt6cFrh5jrOn+EotbxWD1gpdjQsT6PIE28rnPZxhUmV
jCovYBp0Uy31jiZvZ+/89vp6PF2arQCL2jyjlJiDTVrT4XfPYhHzNCJCjq3AuYGqkNgpmBXJaHoV
PXTlVtoh0jDkWDwM/vEHxX+WVCeQmKYQ8tXQ2ZOy4ZCjDppFANZSrAYxGgzMHSnIrVsHATXuUU9A
3fajYG334g8jYzcYTYzAmMKvMpxpu4oUQcwHplzipJS7ZjHwTIBxJ5BKtZdVOS9FSZ+hWCKIt7Rj
QJGcZVMMSmdLakyDTMUrkRlD6nqgMujyiSaYQrTDHobDelgVESgPbDhxlYyrQteSCO2f/NQwHLBT
VPq4JsAsYe3a2rVosxbnQkGOQHZ8VU9BVuiqrAMNXaciIFQweWiyaM1OLIuXDMfQJ51xMhoXD0yD
fwZdzIRzE+HHgX4pMbPqFUnL4nlPXX2FXfUqnyEOPiqLrUqAKg/IJ5WlBAFzHpt1QlVV1EuPf+cn
L14f1l/zPYTsgKhx4Sn/37f8sPnhnTfrnVUkVXIHUfBn23YqiJzShaqzQ16DRQ8aVCA2Q8QaCdGf
a0xVA1VjjTTeyvadtHQJBhn1eHPnEGXJdeXn14fQJMDAT/DrIwAHyyx0Qum6YfOsfrbf3n26COvd
9VxMtZWHfc+9NXw/NKV176UtKN7zafu9SiKbGrVDouo5yPOuFbKQoO2bFUQzoqTczOktJBikrAcl
MK34BpNXr+sFBruGSQS8GupUJ/d4c7PFjkxIR9n0guHuuFYleu/1uD1cvHz/tquetAtOL94uX59B
eQ95g/X2bwD6kgNXu3xzyZ9N5sMUy2QJfzpZ712wCJ40k/uaScOqVtY6tmx33FtG7ckIAepHVjK/
/FzIsMQh5MFEeRRHtm7GpLEZ8fSyXJzv9rT/e30yb7lKlCidgmSEhMVLxGqRFvnX09p7qYYVsmyK
cg9Bfb7tBVtSxR5T54OyeuoPU4ieGIcbhHi28ya+Pm2+bS9w3eD43j/nr7Cg84bA9MrQDFDrBLTm
5E9wIKBHE+yqXUHc105ZdRShvKl69gbfDB5uafr8OcOdMcU7tRvaR+5YWsOtoqWGaI506j+jdN5C
qrgYfgsyzWhmzFU/z8DutVkonjq7BBqpCpnqMM3XlLqEB2ZZkPCxKph3CeYYp+06e41UV1Sk7s5t
aa7KEEQuZ0ToglNrnvEI8m0VS0vRmoThKZdgyIt6iizjMZS2z7AsNJogXexT411wnegUc5YRSIf1
RrBa3OoQlKS+1LFu3ZXimIJjX0XJRlWoDdC0mg8QFoH9orTWVOksjKvxA6Il9e7cmlFJDIR0Wqrm
VuVNo3WIaj8NK3lpUV19I9YUEGpXYT/2VeXPqFjrKJxrTVPVeNY5RiU8GqOLlNYzRXOCVkGmRYBX
IDRtsXeMuu/eXhXECJoGdJkUAyL0SK3+oAgOVk7gBMGoBsbqVLXLkCnPYNtJMO4gUNX5YLXvIFHK
uTrTHneQUMNzhGHbbKmXHZpA4lP2qrDlyqWRAvReOGmuoNrDyzSqoDEEsoXsy9PUTLoMCAIaxMic
Q5U/zcI5v5rr9T1ZNTKSholcQAoX1F7Gp4v3X9bn/Nn7q8ixXk/Hl60d+Sui8iAch6CxReEa288p
DkxTv76ysMW36rJLo2xa1Ho69e+fuMdqKlVzVo9Wpo/RjzxcPZQ0VYfytniRB8dmalKqaRtQ5ssR
1arVPNYXyCxRCMetAb60htwxjDO/7kRzvjQ1fLpGV1m8Mz0xiFpzu0j4DA1/gWY0uvkVqtu7X6Aa
37vaymya2+GocxFciwyfPbw7f1sDwbvOAsq2MOUV2/1HvYQ9b+BtMt3C1zuJeru+tpp6KlqqfgWu
vEvdiCBJrN8S3OvriEk9IsB+P5y/bA8f9sdn0KEv+bu2YxEMKwGlczOmmZRtKvXPuQQnpl+ttNm1
UdznBBzT5wybEUnTeQL2zU7kq6aDCZ86gRGZdOEEXPGUEeFsXihRUgytQl9FoIpV7lOuKMD/USGi
Vo3J3EpRsSmCFWbzsJyI9qrlzgmFZAcn/uPV1hwg8ynvzAHTyvhzz8iiYGy6Nn0VGMx8iqL2VEVj
rgROVLIBpqPT4ZiuT5etTiRVldnM7hCEtUJbm2Chyg5mlKCeGxqKXoT0sxgllvdqU2DMqdMLtuiI
z69Ng4LQ3VrTJtT5pcDuFtI2MSPcJz1vMmTVEDopKA/dFNUMMYQ6zkMUiBEXIka+BW5sBg8o/wk7
URBfZYdPnWtCmMfMrVrRTJb8ZNE5JLroJzQ4JD+hUF2/d/dXuTfU1OCzqgu0ZNzUnPizDufNxhIF
1oWFogWYNi15hnrAOEKLlqwAImhd1d07kPPHiWk2KvAkNPIt+CErg9DqwVMos0nN3JbNWVM9SIbG
9SWlCeCQgurIwzTw9vM0EpBH+JLFy4duRAfeUVKIPyKUpsojqfqy8mNVGVGfFf4n37xd1l92uf6M
w9NtIBfj1CYkCWOh8hbLUtVQGQYpcVW7AVe2xhhJAcM6+6zTETVB2cTpsp7FKtxnJBXNXdU7LPFh
hISDOQXun1Rh1acHi1R9hJDqzxNU7umYSLUgugQYdlMX88sL7jtOfdZxvj+efhhVREf5p3pNMjKY
+oFJuWbSblVQpQrdk2TLSfGMlwqdekCixR8+6f9aGZrfq8H6sY9hJWduVzvnBpPVfeq0MiaJFraH
m8Gnu4pCv8KmmOmsb24M9SMMvkq9tBqPVwzS+faXBH7ser5/apNpQB21Udb0YWN1565EtHdI8e3G
z6e+vxk5D/HKxO5A+9qAmdsD9g5px6s/oX94t/v38V173qeU0qiZcpL1T9kiHYc0Crqn16LiRYfb
r0368O7f45fj7vmdTVNNZjpBPc74CYwbvyre6mnKPru9yW0B01rnYK+qNuruJPACDFvdUEURUulQ
tyIFWqBff2Fis74JDkPgMrYszUm/xWgYTbCLvaJepPoc/yR1MTrIv283zjeT1PcRCzqhpk7Pt5ty
hEcdr7RFWaPooHB+RrQQcWoGvxUE8priO4/KYgmUBCgqSnvm5yJ6garSX3y71WG0LtzvjutnXfKv
LMlS5/SmQ8cruJLm6cB82K2ppdEX4tS6hrLSJPeDTYuv2nTrXFGlM5YXqY9IZQwBI4ueM9VovGDY
OlcFVRJUjgTrHVO77zWN5WcIO+eZ+vau/WVdTaXnQLq5tZxJZ6kuTko0NqbsFuR13TUTtPXdFcNT
S2WK35KM/A6Mm+XvErYcdkBxbAaF1Xzml1IVbOw34USzhkSL2HRqEAjzGchIoL4XCbFVqFbIELK0
QsHdz3U96lP3BT1rfTSDLebHXEzklPAJuHcjt45nBJjgRsBaALoxpjlxw+404c4KhAhMowc/9R3y
joI1Afnr+nRuWQ81DLGPOpTvWcUK93l7TRTy7mCLAi5Bd2g4qDopQ8WhZjE7q4fbowq5i6ZmcVof
zuVLbLT+YacIsBLkEqBa5klroIquWlxroGSuB8FQRM0ESfGrsdjwW7Kl64umNikLAzWXK/njqm3V
IOVxD6VildK0c+jKd/aed52V6WZVLmxDVHyShuIPjMYfwt36/M3bfNu+Gs0D5s2HpL30nzjAfp9R
UQRgOsrPNFsjYTJV3SgfBvqETenzBCVzqT+EkoalcGBHV7E3NlatT4YO2MgBSwSOVJ/Rvo1BccBF
0IWDD0RdaCZIZEPh6NsHw+y2d1O5Jly1fu8bVblyc0Wisn59NXpBVBZTUK03qjuzdb3g/2CX6txU
msntc1AvIsrK7x3ATkOdiYOjYKpD697uMjRJImx8QW8i1PUVn8CNWlJdEqgeRdnutzLpIFGozrgK
xX5yJkVTdr57eb85Hi7r7SF/9mCq0hRbbTXGQqp9FLISPutVxNifpaPxvFVzN9WYi9FtSz545JCQ
dAbA/nVEcA2tbd0oFt3QK9ie/3pPD+99dRidCNPcK/Wn44bPCSSvvvpXB2T8MLzpQsXDTXP6Pz9Y
zUsCIaS9qIIUn+hYBwR2LSm6paxdluDis45HuWTEmS+apNVXsj0zUdFvYyua0UrZumnr+C11X8qS
3cLyrv/+AE5uvdvlO71n76XQZDig03G3cwiaXkhAfNSzhMar8MN1LBoZr5xlnhqv+35dA12fDrRp
EEMcJdX+4u1547hG9QcnsX2TGhMQPqeJPyPpVWThUhzV8Wu0umhmti/3E6t+32u7NAZMJkJLl82D
ikHNi8a+DxrwFWS+20NezwpEjp0AVPUXzxAExWby2UMA4cOVWSblP71QVbkcbFU4rYKa+ShVBvY/
iv+PvNSPvX2Rz/YYw2KA+/yKSWSysIzyz5fonC5lnTioAOvGjRv1MKP/EZQ+a1sS82VqfGngnM8g
UdXFhXpgIu2exJ5xqqrXS5hNSA93s0fIV4s0oXnUcPZQ66YR9eFU/RUURHz2t1cVYN8CALELBhl1
SDujFYJnwBVx4NDq/v7jpzuT2wo1HDmfjyt0QjUb3QfEjnsCicEer5WnCcIBLkOXRdMYiD6m2Koq
G2D1Cut6TzZJQt/UGIuL2sZ1E0CI1DgIn4wIH0eLwcgqoKHgdnS7kkFKXRWfIIvjR53t1pdDfP5p
POI3g6E5DSStEeUZw1K1BBMf9zzDpQH/dD8YocilC4RHo0+DwdicuICNXB9XVPsSQHJ7a3zOVCEm
s+HHjw645uLTYNVsahb7d+Nb67v1gA/v7keOZUHjBGwQzFg6rj40N1Mmt8tdqW83V5IHIbb8uj9S
steRMFBVFXx3DHQBl0iMbhruG6DxiVQJLD/UMlYsETFa3d1/vHU9shQEn8b+6q6ziPoe7+auswwE
xvL+0yzF3Gp0KrEYDweDVnG6Mvv2RsuO23/WZ48czpfT215/OHz+tj5BiHZRabai83bKTzyDuG9f
1V/tdtz/92iXppT1oeZeTRwZuZQcRZDSIpVlpEbsjP2ZFcPoz2FcZmjxf4xd2XPbSM7/V/y4X9XO
hod46GEeKJKSGJMSw6Zs2i8qT5LZSa0nTiVO7cx/vwCaRx9o+nvIIfzAPtAXuhtAt9mp0ka4Np61
U9iqUFZ5+UMeqaBtOFqBg7788pHqT6cS7758+ox//vX9xyttM/74/Pzt3Zevv7/cvHy9gQTk4qbM
GkDDK2j1kGw2uABISB81hfmg7D3l7+vkx2ZRW26xUZIHDm2Xjl9i+Bc0lWDPI5CBvIr3s9sfVgo3
U8A1da93v/389+9f/jKruajbRkkmLVMtiioEmAsxlzXLEmTroL46m9zYwdfTjsMa6GRV05w1tbnL
qoKcabjJEz9YakCfF2pYMaIYIqISjFnfvP797fPNP2BU/OefN69P3z7/8yYvfoGx+X/qCjdVS7Dx
Xo6dBJX1faZpk+RMzTndlopKG7ZMC2FA9Pp8OGjKJ1FFnp3k8bJWt34a8j8MydLBLErSEJnAUHYj
fRn6E1JXO/jHVWLRtcq30ybTKIZRl3sj+ldFdDqVpGAfVjEue3HMeWMm2cItd6FJUNU0VnLVI+wb
yrb1uZOAhUPgzULed4bU5TmxLkEynqH/hU6kzw6HspBB2rQ5VmfD5nTXNOuGkqTr6kBkdHQNrDqT
rZH5pSHF0TzI5JLL0x94B//8/PJf9ewGL2SQ7fefGMhyHFTkh8MUyjdEc85uTdJojmKM6KPZAsdr
V2S5VUegH6HZuPPgCS+b3EodlrBLZnVfY47SFqIWI1bM86SqWPZcR2wKezlpdOtYGdwI1oAy56+S
gANP/TN2W1fQLKkofSPFtyk20yaKNZqMUoB2lH8qVLoY1lSqHZkarCxpRTM5ytjVL7TbITPcCX25
rzSTgYlrvCzAHnUoO7II580qMJHqjAF/hHqfjaZgaEosenKx0lZ0wC4YvbNq1TONYvRX0ijilLXi
eNaJ/bGi0/a7Ck2V5YStVsAlMYDoDMMw3gByuRP67y4z06z52IEANVXXqfFWgIQNrhEey+6sEZjm
V6nXD7UDEL3aOzTo6Lgf1ZiqMzd2qNkx6oiaaXGxMkMnI/5zebGu1XFfZ7flg5ECHlX2nNEqtvZ9
1edH4wMMf0fNxi2OVKTJencu+7ilNc25+hy4qV/z18gAo88Ae+aIYDvqQYvBI2yr0ftkzJBNFXbS
1ixfff3289WpnlUnLQgu/YS9VqHoE5K236MhVY3HfQa3tMG6lRcZi6ZLWJOhuSViVrnw7vEZYzp+
wTBKvz9pW/3x6/NFlDC1mGWZ6CCk7DKY5ZlRkXdleboOv/pesFnnefg1iVOd5f35AbP+26xSeWec
pFi44TWqtILbxkR+Cz14dzZsTUyJYsnZ29Gx0GIMSDrSJ8oVJlfo3YsoFyAsOKp+garQOUVlhvPz
rsuY5A774JYjd+qptEa+qo5xCwKrT102554tHA7PLnMstzMX7nXuq1PB2o/MXH1TaGdoSyZuv5OZ
5x6DoJ1565iZqYHVrq7Z4BZLWdEe9dzt2JIQuOO9ZxYmNFEsO0bK/X1VwA9Gyo/H8nS8ZAxS7Las
5A9ZU+asKfOS3aXb4UXOfuA7log8n4sINHPgiERjIO7rVgxtRsfEaynsRZXFO3tMUwwpbq0Z4fMl
P8qZYhGJQoRBIZJ0o53V6nCSJgk30ZtMW1f6iI3WP+4sto7664yKtqwBfVPW12boHUW4gN5VDXnV
8Z/vLoHv+eEKGDgqlz+ked9k/sbjP5b4QQv0pON9L1p7AbZZ+NMuhhGPzBxtKTk2lN0biRXZ1osC
vlLFAyibqpqmgsesAUW0ctenLHt+06cxHbI6G/Acu8q4GULjHXKMos8XZ395X/XiwlfkcD4X1eCo
B0y0ZevAKGrd8WETD46vq7qCXjPw2QLYl7cu+YhYPCQxN5loRb+cVDdjTR63/T7wg8TZAMa07WBi
lTuF4z7Lz7BPSD3Pd/U3yfJ2z22ywfdTz+fF1eQwu7rat2mE728cWFnvMa5n1W5csmjEIYjD9E1x
NPTjjWrAfnioHMOiuU38wCWntjyRzezbrVKAMttHg8edFKmM9P9Oj59o4aBH8BIf50qHzO6LPk2G
wWxXnrdJQ5/32tLZtsnAuZ7p/cAPkzRcqVDVB65ZvBc5zSZnJxx43mDEfLU5HD1NgtEa6ByObe6w
1lOZOtjMc9s6beKALZkaP0DHxNoKLHo/CHlPB52t2b9djEu3B9Uu1G17NY4hjaONazD0rYgjL3mr
NzyWfRwEoSuVR7eiq8n1fGzGFZ4L/q+N7g8ick33j7jdrwZrr2eEOJfUNG2bFPra+QRbppXdEqhF
/oYTwwh31eP5lMGC2/bokWntX7M+D2IuH41rB9qLem87bgTDwQO59P35ZFYKCj/A6L+jGKy60cXE
UOXE0t536zWEeT/dBtGbkhhHPiYoy7TG22TpJuKuqiVOFoI7WNo1V8AFKmArUOgW4QpKtXamfTv0
77emvLrygOGWzt3YUrbAurK/8HXT23NoA2jOtrw1s+jv640XeksaLgYqPgPG3mYCDZlc2EOWNqsb
jIox52fi+T6Nkg0r4O6ML4egsQLJ2ZJGkSVB6k3d2ikNqaDKrmPmg1gcjphRW7kiXbkyq9as0xAc
6nBjndKMZJpR7WE3gsZ2xuCC2SSIt+6uBHgcxJndDfMmC/k4l2Pduzsa9cu0YMNxNMOm5AhO7K+7
ptoY5pZEMkRANH4jJ6FmZySw95QVfaKYSzXRg2K8/zf5fd+iBCYl1IISjDTeVW8EHa8lEBhpJht0
FnZ8+v6JHIKqd+cb87ZTt5Kin/i3boUlyW3W3e4Kk9q1OUOtq10rNIOZkTtj75wIG+0j5Hd6ziLA
028zk6zLr2wuNJoBYbK6GDXGE5bRBm1OZKJdTyKKUiaRmaHeqPYYnKBnN2zuvFgeVf7x9P3p4+vn
77ZpVq/Gs9DiI5+ht9XkB3QSMmKeUDknhoV2vLdpwLeQ0fNYf8TpcqqGbXpt+wf1tRv5SJOLOL6k
FERKRO+6AGWDbu3MiDajAfv3L0/Pth+H3GHPodj1PgFAGkSedrG5kNXwrIzXBvuJH0eRl13vQHnJ
rKcLGP49noreOjrzXA7NxEIBGto17PQePYGn7nohl6UNh3YYJawpZxa2dOXQlyf+DQitfPcymgqb
Bt20v5mAqwkcMYi1mvRBmg5Whzi9fP0FcaBQzyDzkx+2OaXRQShcoiibCt+JW8v79lDsMEKgu2qg
/YW+51lNJ+mD1WrYFHhy4gSWJvUNDn1bpxDt4ToN1PHBFLNaIs9PA79fmzn8uBKJI378yLTLmzhk
d7wjwzhNv++zA1bJqvOIE2ZWTMFQmBRRwurlKtMuuxT4oMKvvh8pobIZTktcE0+XM8LCpWP8YqWm
wAQNJ0vpW2nsRX2tW8x8TZ7EVZ32dTmYrEbroANszgwnnCse/ZCzxZw+bdWokQpRkYri16LNt2YX
z/uuthwrRvAkja4K113a6VLXuGgxJT3eTZ69ypqEtJxrHgr1dHG8kNXRfRSPtcYt4rTSkbXMLA1V
M4Y94fjOIXdvBfBufElMXoPttXjIsHzKyIoMST5cVJ21yBoLuss2oXKsuACzZc9cxgUbqvZYsts8
KKOWEfrvmPLGyOxER19TXKInNSOHP23DFaZvlTSJD9+o1ZTtiWqe7i/ka945AupPTKCrW0wMC12m
2DkjBCOsOpW0v2RTP13uzvwWFrnuoJ5ojjI8MPXqw/CxVQ2qTWTcarjQSTBTbGdL31N0+FHq3QVm
AzTzkw7/9r13kDNGB6oXO9aZLr1BMJp1EImanCC57o4gvVN0Z37TXPhlAzEZtMD19C1ywO6KXETm
0mfP/375/uX1jz9/aBWAKf1w3lW9XhEkwsZd2THORM0czUh4zmxWzPWXMRZRyhc0fkM39tFe7x9/
vvx4ff775vOfv33+9Onzp5t3I9cvoJ2g3bBm90pyQ9d4nDgdIihKfNuMAkqMA0j7XIFBo2ejsxts
nPkxspRNecdtfRCjif1vk3Kd3t19PwXHVRhuy6atC132Z6yBMLsItMaa5x31g6rpy1xPTPo+/DpH
h4Kh8RUWKIDeQbeBNnn69PSNxgtj4BHMXkSOHPvsLK4l+XDRh+fXPyCpJXGl0Y2eOL6Wo/Uutidp
FewvO7161Jq6SIk0ej8wzBQPAYNbmAKWZn2OO9KFAUcG/6m1pipVs2oT6o9gFieBNMY1fzH1undw
TKs7LPgLg7IwVbBIIHDMVSN1w8OirZyx4xEzEyVaOUdow6Of5ukH9qN89lm1vYbJ8pvUSj2lUdU0
r8MVqNjzIVGJZZA25eXpULE2iAjCtLfTHn8n4qVHraPWbPBoTYWFgX+dUgpqmib05KCF9D2ppI1R
TLQMYDNxRa2VPzNDjlFLVCh1k3jXum51KsUFPT3ouXbn/Fb3nkUqbFHSSsReoDOLao+vSGis6Bys
cw34VIhBmuYWrWqPD6cPTXs9fHCdhFKbNcxZBXain8+vX749f/4Luo/tl4EFuwxqp2u/v7y+fHx5
Hnuf0dcE+n7c6YVebBJL1VcCob4u42DwDKHpM8xMMqKxLvTxOUGg99251hNDE4qm0pXylt0sH1WP
kiP5JSz6hjx5FJXhIL6Qn7+g89UiDEwAVY8lybYV2g8l7sy03+hbBKxmQtqYgd1EmFJeU/DvW1LR
1ZGlgHRsxVRbYVncVbkETF1gLtq/KQL168t3Sxlp+xYK/vLxPyZQfqUAf+3xAR+gR/vOU9nfn7tb
jC9B7QwbswaDYdy8vtygfxcsc7BwfqLwNLCaUqo//qV6wtmZzVWsTrgNXLoOEuB/yrHpGGfJAuQ6
wyaAG8smb4NQeKmuMluoVJkdqCbuERODH3n2UVIHkv7x9OPm25evH1+/P3MvzbhYptzHyI8Y7x+U
clDOSWFSH1CE31pM4pEASpXoyV67rhpYyyM/MDmq7gNNgVYcLocaSVnnhnI+E693nGkOwda76kSF
/WAS0nGWGivyz6dv30DfpSJYipG8iLzPWqO+S4dglFKZ2S6NBXt3LuHy9CgtgzRqS/e1VnVFxYYD
ljFW0AdDDx6wUrN5D0DUz399g7Fl1zgr2ihKU6N0I1UP96VI1rOFgPTAWXRQoLdROBiJjVQmG0IS
zxKPvOTk92vE0LdVHqS+51QGDWnI/rEv3pCSvPe3irMroJR+c8/bd8suRXem3CLTw4Zm3LXon8h9
iUuUdRtuN4rFjZQLXQ4bQuzyqI/S0EpfWnuknD3Tgqex2VpE3vqBkXX/oRnS2CTKy2+birfeRrry
dljr1XZ7zErHajvRMfbWH/ju6TlnkSYPwzRlulslzoLfERA+dGiGGrKdjSksVeLuy/fXn7BuGdOQ
nnB2OHTlIesdJuGy0KBnXlo2bzaPqcYU649y9H/575dxx7eocHMm9/6487gWItiwIQFUFv9e0VAX
QN+XL3Rx0M6OmKKoRRTPT5qTNqQzKoLHslN2mjNdaGeGMxlrQjZjai0ViLsT1Tj80JWqZs2tQayZ
k8qRqmZs2qeh5wJ8Z3bhW9ltwtT1saFqMBxJ6ihSkvouuaalx8Uf0Vn8RJ0C9HafFSZ6Ha0rhR5N
RCFPFliceqtwYXCmWzmjM2hXyoBpBoiRwusHO2NJt7fwC1uRSVYWxefhLNTQRrMiv+4y3DAr57iT
KRd9rDSKtLbBfdZF08BGwF0SilXqKgpuYdDbEnUDL9a631iya34feD53mzMxYDeJlf6j0lNltdDo
WrfSEG5KmhjETjPPm0oPZLbq02e7D0EysJeEc87SSp8rU7b1HdcBkx2ZQ7YIg7q1v5T19ZBdDqUt
CrTXTrTF00ACBxL4g41MxmmN5t4xod0QKRc4k+iou3khJ9UxObbqE0/dpknAObWoDGlq52te2S3l
IffftRT7MI4UQ6WFnm/8OKjZOvqbKNEMhxUsSeItN7tqItomXGmhY238iOtYGsfWswuFQBAldj0Q
SMLIkV30ZnYRtCebarRNPVeqseOWfR5hzS7ccO089S7q4NgGwXbDju3DuS72lSOM49xH+8hjV7qp
HF2/3US8bIrtdhtxK9LxvlENOenn9a7SgpFI4nhgfaxsR9XT0ysoXJzZzxiFqUhCX7l0U+gbJ11b
sRek8b2Af4tK5+Gv2FWO2J3B9q2PdWVEhXzdjY3j2YLutJpBnwy+x4mlBzk6gI3v8UVC6C2BAU/M
LS0aR+LKOYnYnI+9uSk1OUSYrApC5Ekc8JIequs+O03Hnm9k05aOR6Fmln5oua3ShOfwV1bh4xPd
mSvOhLfispJKIeKAkSGGH+NrOVofw4q1kuo+8UGb3nPfI5QGe15FW5iiMInYUDcjx2QYr62cE3io
Iz8VDZc9QIEnuOvDmQN0o4xJE5rdph6rY+yHjAArPMTT57EZ6tOEK9r73PHkxsQAekvnB8F6B6bY
JAfe/2PmoVl/bTaSHGwxR8jh3GZyaSetGrhlpCaBwJEtrNxrAwI5Ap8d9wQFa7MJcWzcH8drk4Lk
YIcLOfixDtIqR8BKGpHYi9faiVj8rS1JAuKUB0g3sukhqKlMH5dIyE7lGMYvDt6oXhyHfAnjeMO2
NUGstY7GsXVJDYq7Xf06b0Mv8Jky1UNXHnAWt7E+N1y3ZqAVQZiyfqtzuuVpH/i7Jp/nBLvYXQIz
E6dKLetaPgzMmGnikKNySyNQQ7aLN3ooRo6BUyYVmOlqdZOynQboa/UEmB+HTbpeBnZGaRzTScNu
IRQ4CkK2uQnarE5ExMHWoc3TJIzXZ3Dk2QTrGtupz+WhWyVcp5Mza97DRLBWWeRISGGygST1mCnh
1OZNwnXGM76Ja9y+KZhNpKuErTIU20Z7E2Tma4wYwKp+G8T8660azxs9fAeb/na/vm7u2uzaiZj1
QZpVF9FewweupNWuueb7fbum1lQn0V66a9WKlhFC1YVRwM1bAMTshAZA6sXMdqbqWhFtPO4TUccp
KFd83w8iL2aD9akreMLuk0ZocQtcTyZMfaZL4vIVhVy5x9WSqatcCx3fBJ57aQNsVeOQS03KFzPc
bDbMhISHE3HKCqhpQT5rq33bxEm86Tt2ZhlK0ATWeuaHaCPe+16aMQNa9G1R5DFTXljdNt6G0wsA
icI42XKlueTFlvfVUzkCj8lwKNrSD9hJ+7GGGq4lKna9YPRNAds+djoG4I2NO3CEf73Fka+nUTQl
6E9ra1cJ25mNxy7NAAX+ql4AHDEe+TL1bkS+SZoVhF8cJboLt2tlFn0vkohNuwHtjduX536QFqnP
qAoUiidwAQmTSwa1Ttkp75QFHqNvIn0YuOoCEgZv9IM+T7ijqhk+NrnpLjYiTet7azsPYmA0OKIz
EgE6O28jnZMH0COfSf+u9wOf3bPcp2GShOs7dORJ/fUTDOTZ+ryPmMIRFK5CbMO301+bL4Ghhum5
Z5ZSCcWnAwvFQXJkTy8kVh736wVzx/5Y+lyPcZt87zrvCpiKkIqnP6g9kuTLqcLhKD4xlU3ZHfAF
cHnncd7vZQzHa6M9/zGxYwxFetsBA2+upTs9T3k4Y7jlsr3eV6LkSqky7vE0ih6f46+9mE/oyUKK
l7ZSGD1txZ1EwdVCMjDaxV5H41irQP/vgpTNRfrK2nZseHM4NaZ66Zv1+bE4sybHYgeNJkS105zO
xE77cRVFdUaHRJV36WwKgyOL8blD3T5gl+N72UyCO+PBWmm3gwarv//8+pHen7Mehxo/bfaF4YyI
FDxu9bXrB4yhIS2f2FcX6KOsD9LEY5KD8kVbT41VQtTJPki5tMVk6DaQo5m+/Yg06CjDe8bLilQ5
P1tRhfDUNGSvwyc0CvRCj+esWigZhW6EtJkRfpMzweyB+gyGVk5+5OnywWPXwZTvSNTP+lRA8xwi
oA1iNbAcWmG1JELl2gdo8GGrvmqL31J8CKMEow+JRpPBZozyS2Jkio7IvL2CbPv5PlKn0k2kmRjR
0w2nso1wuvXstNCIgCFuEyZ9IHM2MoT2cRh71jdAZbU5AqfTqSX78nGQYUG0AmG4FjNl2MDDljDk
+/4l34Fe67lcSuj7JrU6lLxVNGi2GR2SRZmvpS6qTRKbwa0IaCL9CZmZaBnH6iy3Dyn0Bf6gnhge
RO4I04Nwj4b/YRgNGByLv0RBNtO8UNLoZv5vK8G64W54SLiGQSIaD/pepBm8SjtEduc4BaTSRTcZ
LpozpKRv+cOtqahQB3YenBOQFo92wlu2hAoc6NKaqNxcPmO878nIApNHqJgtTMYaRqC0KQCRbv1D
SYxQdim02Hhj0CG7T97XfpCEDFA3YRQavaHXHgYmSlL/j7IraW4cV9J/Rcfuw5sWV1ET8Q4UF4lt
UlQRlC3XheHnUlcp2rY8thzRNb9+kABIIsGEXHOoRfklVmJJALmE4WFlEJPQixYUdelNqIYOqdjX
Bp3bKRFf8+nAZNdKmL8oXd9obxU4c3dKcybLFxeol9blS4CTecGpPnlXoEDPOZglC72syV6l6Ia1
WI8Ec6s3wKFu1MFR9JZUkjO6UPkum/QtOjEgPd1r8lefw3DpNjZudM9lOP0fgbw4ZCmEeWvjdUYx
gDH5XniU2LK9YesycoH0LITngY/okZGd78ZrpPiMILWpE8XESRtFIS0BaVxp4JG7p8YiBcyx/zVI
jfAyrZ1rOBfrQCGRZJnIvBpm1ZvUeAy5dUQ08ZfIm1STn44Fw/0tQlw8NQ2MuirVxlK8DbwgCKis
saXfSC9YufSwuIZAfhZ3KG8FIxNspAvySwmEbKjQkSOHHyB0C0y1OQ1pEy+IlvSQBTBc0K8XI1cv
f/4CW0AaFCCeKPQttRGg5XUKc3EB9tNiQJ61FrMkrTEMHvzAi0CbDqDBFLkhPXiU/shnTeVcvB2f
ce2iKKDUszQWLn/jyzaMfdrpUpK7WgZY6/gBuWphD38a/TaK5qFlORVg9GnFgIt8bR95Rtl9CrV+
NLcshlblQp2lunXJJrNyzaWLuWW9grcLJ7Q4fkVsQl7+BTbXI1VEMFMwdz2qslNB28SwuG2gjnd9
Mgkm1yf3jEHotmFL7L0ZoUJEvl60aYI0QprFUY9Nz3KjNJWlRdwlmYi9avpjMLgIDnFTtX57eP1x
enynvH2lzTQIS8xpo9O8QeDSyYKevz08H2f/+fjrLzD5N73s5asuqVLQyxo/L6dt67bI73XS2El5
0VTCBwdvTopSJfxPXpRlkyWa6bYCknp3z1PFE6CAoBWrssBJ+FGVzgsAMi8A9LyG3oNa8S9XrLdd
tuWfgLrM7kus9aftHNwf5VnTcDlTP9BwelWnmXL9glyBcAiCDkMVWiPg1PRr/OgdakwuJHk29Q58
sYKnEdwU5qTi4opuhDh5PRuEDsJqliVqgLxjwFmDEsD60PJ1mlotOIOSqFEBVdY29baupFMXNQrJ
QSc6YPXw+PfT6fuPC4SRTlJrFCGOdUkZM6Y8UOlVBaz08/nc9d3WtK3TeSrmRt46n1PvMIKhveWH
pC/a3StQi7JYuu5hSvT01RyIbVq7foVpt+u163tu7Js1vuIdRlWWf5GbHL+0ArI58KMcLV8BXLeV
57oBff0LJj6liDutdyZmVd/sky8j16Pzy/v5SQSIfX166MN+T7+eDI6cmG7p8iau+HEu53Pql8BO
hroDt2dV3Nxf5wUPxuqBY/Q3db2+WkfW65rslcmy3FeB1fut7ngOfnY1Y6ZXQ0TvwDVnGRe6p46t
7kB2m3a9XwaNtEsqTEirWLpTmUIs+zJOGY3+Z6zHcOopvYNh5IZDVhhejDCx4ifuBiD0+ijrB2Tq
GUehslEoN+Vsg+e6rRtmlBQfuiRuUvZvz8VFqe2zq8u0o2PliiKHYK4o8W3WrGomw+HmFjeniK3Y
tnSwNdEAm0MeyGLikUd+mj34rWmILwYTZkKW3KrHjRRVkRadDFqHsDhZLjpw4p2YX0k+p009hmzS
f8Uf305nXYwYaHrWGzBS5NtuWdbgzepr9u/QR0U3ldFg/apNEOrEaEmdyBqDBp3JOrxQ4uE+YYvT
gsg1la6HCncyXHWY7dLC8mDec0LYzYSKPy/aLGIcTdqlPIlC6d3dpmBtaX51zZkZUUXd1VkyFf7Y
OZmJ7yMCVudvx+P74wNf55LdfvA0k5yfn88vGuv5FS7h3okk/62ZIKlWg+vOmDXE5wKExUSPA1B9
IXtb5LZP+QJytatF1nTYWp0DPpmtlIxX7dMy+LLDZctPisnszT8kt+Yc5khRHUQj9wddFLr6qfQs
YKhsitB15rYxW1S25QbQqr3pVm1yy1IqLavzrq13IqbydDi11enx7Xx8Oj5e3s4vsN0xkCpmPOXs
QVReP5X0Lfv1VGZdpWsq1U4aEy8TILhXwpzPymcdDYc2363hHcC2L4kuBWd3aqVSrmDE2knY5umr
Vb++ThaVeN/t+QGAaBZgjrdw6cVIYja7FZMNG67o6AJpXyHkYEXCK4ihLm2i1pos5kg3W0ccpGRn
IN3m7gpIV+bGd+Y+TTesIkfEJ53bawxBQGcZIn01je5T7b0JPHw7oiG0f/2BoUyCEEfS6aFV6kah
a9E/63najiWUH6WeIWFeUHpEnSVANFICPlUjCZHqbogjpHL13ZLqOwEExNBUAD0YJGjNjvwWAlqQ
aqwah0eMB6AjdVKNjmxcdLqlSQvHfA42UKvDPo3tcIg+WUQ4l4etAjXAp+vm+UuKHnglmRHopuvn
5x6AGDLU7EmrgviSGVs4VJ9zuus7VD9lLPIc0gBAY3CJxUfS6QGlMMPD8yChtlVIOg0aNpjttu6a
G2/ukUOPH3SW0Ty6thAIFi9YxNO6CSig1j6BhAsLsHRtiLcgvk+P0B0k0SUxEGQlKIBV0dIJu7uE
S7rFumix5mHPxiVfJ4yu9S5wLCJicCqArrEAl8QAVcDVVPSWByC6qDYAe5YA2rL05lTvKcCapQCt
WfIejS2dLbBPlo+BzTIhOA6KE9TDJ2Jx/yGrB4C1YQK0lMunGJ+mV0ptSr5lEstb0wahQ+xLQLfx
B0uqCmzdloHFsKRnKdZVnLLdNNseoRs/oE22rmIyecVle35W3ZVFXlDisuLoTycm+ukxmLHK9cib
VJ0jpKQ+Bdg+XQ9fH3icyw+oFY21sUftNkAPiOnDWn7qjwkJvY2ZGwSkgC6g0GIBr/EsQjp4FeKh
fTiMHOaDmg4tbKr7Og+pnKxxcFGV2DJavj37Djmy2zxeRgvSyUfPUd567jwuEpfYPzSQHt46A7lw
DQyecyA+9Qi7B6plOmwTsjCTxfHzhPdqZSyrvs5wrbVpckARrAeYebHrLjKyFUxKgdcqDyzU4Waf
xo5HSVx3VRQ4REWATn1vQbfkE9H5LBxiqQU6Ja4BnVqaBZ1YIYBOSbZAp1YIQafbtaCkekEnthCg
R8R6yOkRJbRJum2AKvT6yASdvjld9aWlyCUlYwg6uRQCQpub6Qz0V1saxvMK+VqCIfC1ReuruA9a
hjuXrBMImgtSy2XgaEOPOksKOlFZTg+x7kmPbOM9P2Vc2weBI6AmLgCRY801op2AIA5qddvF4OYl
Jnum3MGr3x2LeR8lzbX7AMl5qxjteTWHX8yqPWhZ9e9x6G4NpZPiCTz6kDdoI4yBIWKQog2PCeo2
b1Ok0+fJTaHlwn+MLgHbJtuu243+cMRxI3LjaEIAuU/7AXLsvU6rarDX4yNEnoIEk6tF4I/9Nks2
ercLatLsqbVcYLsdDuckiHt4n7GkWGXljR5cHGjJJmt0j5GSVvBfJrHer3UP9UDj3zcucXgGIO+a
Oi1usnvq4lVkJTRhjOzvd02mv3MBkXf8ut42YBo30Edal2u+14E9qxjQUBZZmSV1ZdYw+2oLbSy/
XbUqLGG+BJ6Tr/gCKuumqPdGO26L27jUH6mAyGsgglWbdbu5pwxGALmLy7bemVlnd6ze4gDGoib3
jXgOt7aigCgadrS11eLPWEYrRuztXbHdkJo1sqlbVvB5VRuDr0ykaQImZqlJ2Na3tUGr1wU1YXo6
/NjRAQEHljwnqgtos69WZbaLU1cOMZR0vfTnRlKE322yrGQ2Djlr1kVS8UFi6+GKf+fG7Ksqvs/L
mG0wtcnkfDB4C77usjpvDXINUdwyY2JDdNmiH4kafdsaA7ZuWj3ItZjp8RYsR/mgR49OGpnuZZE2
a+PyfnuYrB588QH9E1v37coYfNhtaetixXHPlDLIUF2NOFk4hH7JpCIsLowopwZcsf2WtkQXOHjR
K4stFSdV4G0WV7g7OYmPHb5vYK0vAe23u3Jva3FTGd9q3WTZNmb6KjuQjEEtcq/ipv2zvr9SRFvc
1pNZX+9YRgZaFeiGz3mjhRDR8q7bMQ+T74qiqvUYokA8FNvKmPZfs6aGOo7UnkI06ut9CvKHfQWU
9u7dZr+yssTlztAT6R8/iQ19jLmGhA4cREuHBm0Ljdg3bM9WXb1Jig5UCbnoI1UX9TYCB6FNqtBK
N5nkP7pVWSfa9B1IvQJONIhV8PCKw5sCswjIo9zC899/sPQP4Jxtzu8XOqzUqPlaJVZtGcBYCsGv
fk5IfNK2Odq8AbpbMWrIiVT4hklUuyLDiYgq3eEy0ztV4E+j6ne8p/ZZXmQlvSwppuxwv62p+aPw
TeEtllFy6+rhdRV242HSnndAETZ1abAmX2RXobI37Iul1Ko1Prns1wPfUrW1seKSU1uI0aFpK0va
9MNpAVPY5fT4N2FP36fdb1mcZ+AtfV8hY/2KcSFRjj+q5mwYrZPC7MNNJd5mdyBDoBDdKZP6j2OT
R1pnbKsaIrZGvhvVyHZMMKwa0KrccpFVxBHnss86m8bM4qzT3hHpY+aFfhAbxQpjyjlFdCmiNyUa
XgsH8tyhzhECljFWzAIUtTPjjwjQEqNHlgbmwb5ZM04MJm3YBXP9Ok8RsbHSWJnAZFVUw0HEAIXe
YdIVvcEkFwTInU4wmWZmipg4rs/m+ApDQNechsnBkrrIVZ0gKisfg9omMVhbmNQyCZbOYdoeZYpk
/RZ8lAT/mAUPJvXP5igVOkr/eTq9/P2b8/uMbzCzZr0SOC/gA0KUUBvf7Ldxu//dGOcrkICqSb2F
pwPquUbWULi6nCQCU01bEmlqDtFdDR+WEiVsZXScrStP3rVKLf2nh/cfItJYe357/HFlGjdtFAj3
XUNHtm+n79+N/U/Wga8Ya0P/cuAADX1waVLw3Z4KIZ3x4dfxIQYKsyxp9pp1tICUHKDZ6LRJZ8S3
B5JY14j8U3AhAkrDSGd2pFp2Ac4wtSnhRBXscawO0AZ7XL5YbrmcO6IqimTF1jJA42iUwMruS1rR
uu3S6LjgcEjdR25Xuxw0PFHMR6U0poIgpjsEfuGjB6Q+XtdqXWnizwho9xAimmRiqHsrKlI8zrtd
SrimAVoyRAIcRwK73yZweWakGTsSR0Yce7trYmGQ0+e+2ue9zqdegMg/L0r67C/T8aPibaasgK6x
2YQ6BbOszKG2DFUXkE0W78yhNtBVjEZS7jbapfXb/pAWDE55ZIX5kTSj3Z7vLR41bnMbwMcxpUyt
wXjLVBHY+bpL+cK4FS6SirotNSMrQTR+igzGoSZpLNGdCkoaHP6ZOjDwtWcdJ/eD4A4am+/nvy6z
zc/X49u/bmffP45coCJOK5+xju3jJ8v7Fbmd8nmTpUgklxTrwBlg6WdLDKLia9bdrP7tzv3oChvf
CXXO+aTIqmAJ9dlMvoLFv8IWuUHQMWqKKoYb+S8sws8GtIUQsHswEJtA/XQxixN0fsKAF37q3gix
qfzxLQKXedaF5b7iajyNZNPwzAf7JfKAk5VlvK0PYwjE8dAi3VZv6pYf07X2Krp+dy8jTZaamQr/
AcEdy7qWgYoMRrBG2MX6+iv3fyOTgTbxraFB8IbkRwGJsSLwsMqZAZKeWDGPLhJrSJIm2QJHBtNR
xs+K8460PgB8Ei5PSzv41xkyVpvfbUItQ5s7fnjeilOXfk6Li3JFxpsseEl7MMEZC5ekURSRdq0Q
8PX0OBPgbPfw/XgR4VyZ+SgjU0NIvbVw9GfmOyLwwPQZPOw9V/jiprpd4EjuNMuQGbklfdZCXL5Y
+XJmVqtfyuDprOUTbr/WwqzyWoDn0v2U0vE9T1R0dS8e3Vb3fU59/zf87Hw5vr6dH6lQgk0G925g
D0U2jUgsM319fv9O5rfjQpza8OgcUUr5NsYL/439fL8cn2f1yyz5cXr9ffYOx4y/eK+O53tp9vz8
dP7OyWBWQUS0pWBpd/p2fvj2eH6eJOxXxzoRId9YuyLrTaaXwXwOuz9Gs44v57fii612n7EK3tN/
VQdbBhNMD5Bcni5Hia4+Tk9wVhs6kcjq1xOJVF8+Hp5486f9p7Ijcdy9bTGRgQ8nftb8x5YnhQ73
r780aDT5rwIjx7zJqJuy7NAmwnBUduc/l8fzizrXTO+XJLPwmilsKp8NIGcx30iQbweFWG5NFDo4
8nueJASP3Z7FfeLIYnM7MnIoryWYbvph68ntNkAuFhWdn3iXCy8mmseqICC9CSsc7qvxVc0I8NHB
/wYD61Fw4EsTsvkFa540B1emhfbIW+gSBES2kWbB2vo60LpkRbF26FyH6eocS6Fw7Td6ltLwm7zI
BRcmq/N/lvY1RKj8b87INLgxfams20FgPcWi2ckCE7sjbL0x3qe01LK3LZXL7uPj8en4dn4+XtBk
iPn+44QudiXQEymFnDg9lJ7u2kgRsCZcT0T6c6sqdnULfP7bn09+T9IADWW+qhI+sKVTBJpq5qEh
Rk7FPIqmOY1UzJ/GLo46ksYe6ZmKj7wm1R2FC4Kug3dzYCnS1RQEi3aYxFCjbg7JnzfOXDfHqBLP
1S+fqype+LpHKUWYeC1UZIvDQo6GIc428vXrVU5YBoEjb1JMqknQ63tI+LcNECF09QqzJPbmyI9/
e8MPAFhTipNWsRmUsxcn8LCXU+HlgcsYs8t59u30/XR5eJrx3YJvEebEkErb4NO6jfWRvZgvnSZA
FEfX64LfSzRBFm4Y4t9LY75xCq2cLCDqnhVCBi5wruF88rsrcvCMx89YcVnqYxzBxtTl+1Bo/I46
B1PwNADKkvZxLyBqV+NAhGOVccrSYhUHkE8vR4vlEl2rKy/LhvtTBMPkJr2jJgl4dXJU4DdtloOz
Yr730ak2ReR72oDYHJA2rIwNgIPJyUcSsxwIYuIv6H4UWEQ6QgFkqX0xSdAEBZBM5jgMmAwdNrf4
UxUg6QQY4onhkzSQvJB0SMxP5KHeExAaS3oXHFNzku9aPN5ybEkur0L/rM1ulHsz3LdVtu2+OtPe
lX6hLV9+G+9VNCLtxhHkKutXF3fKtyBFDm8WOiJdD3eHGtUNPPSmyTxyCJr+gtfTfIYi70iy4zo4
vLcizyNGR4Pok0Vsjs0jFBA6LHQpuzuB80xxgBNJXSzJIGoqiedkenwJTm3LxA90LW4jQPGYPdyJ
ePbppm5BDn2yfqm/tqzrC3/+dn658OPTN3zwnIDquPr6xE8kxtYQeSG68dlUie8G9A40ZiCPqw+v
D4+8ei/8aPLpFrRwVNyPXv3208SyjB/H5xM/os7Y8eX9jLJsSz6kdxulOqOt6QLIvtYTZFVlIQrc
LX6bEpagoX0kSViElsH4CxYQWJL2Ho/17VxQbW5voXJFAypgbL3zSI3zHdNloNuv0RK5c5j0jdQy
Pn1ThBkXopXrDeRPhWTQBe+KjfE33OFpFphZUhXapxjViUxM3qawXV/SUA1d7me7oRy58BhHjpFh
s1/pLZ9mjJK1RvVpDH1iA1OfUj5fqaHJR+mDnFn0CA9QUC1wn6uLmvDblDQCnwwJCYCPxBb+e4l+
B0u36VaxroysqAbBMwhz36hC6PqN1Zwb8Ci8Ci9Di7EcBxc4orWgRLacFqFN6goW5KOqAEKzgMWc
DvMH2JLu7YWnm6nwJTHSPVekzJc2arr84oSkjQiIK6GH9qUqdD2L/0wuVAQO6a072fkLVz9NcMLS
xZtqGvNN1VVKIIgcBAsk1kjqgj7eKTBUJ5H+afPamB9Wg28fz8+9IzNzNUCY8jd4/J+P48vjzxn7
+XL5cXw//S8obKQp+2NXloOroKfz49/yHvvhcn77Iz29X95O//mAN1b0Np1C5Elyn7qahchj9+Ph
/fivkrMdv83K8/l19huvwu+zv4YqvmtV1Cd57nuBMYs5yRR0VUX+v8WMLguv9hRalb7/fDu/P55f
j7zocVkeKge3HzbntBJ1yL2nx9AyJK5S8KJ2aJi7NDqE03xSoFpVaydE+y/8NvdfQUOLc36Imcsl
fJ1vpOH0Gt3UwNztvfnUDz3eANb3Td158aEwtyIFgZOeKzAvcgK3a8+dz6nZNf12cgc/Pjxdfmjb
bE99u8yah8txVp1fThcsDOWZbwTGkyTaBhgucedXjkwAuuSQJmuhgXrFZbU/nk/fTpef2vDsK1i5
nh66Mt20upC1gWOA7r+dE9y5fu+0aRmK8il/4+GgaGg4bdo9CgBXLNDVDfx20featEGugHx9uYD6
2fPx4f3j7fh85OL2B++TyZ0kuhpUpHBKWgQTEpZWC2P2FOPsGb6eotq27PxQs+j/KnuS7sZxHu/z
K/LqNIfqKq+Jc8iBlmRbZW3RYju56LkSd+LXleVlma96fv0ApCiBJOTuOXSnDEAUxQUEQCwXg36x
tCXoMd/Fu3PDILCpQy/Gut8DHmr3z8D19RKJYLueM9uVpeH72mzMqIjP/WLnbNgGzsqIGsfJiO1z
Y0NpO7EcaAM4sbXhiEGh3Y2BcuKTOVDdneP/8OvCSpQu/ApNIywzj8YDM9YTIBjWzdFmfnE5NhYs
QozIXFFcjEd0r85XQyN6GX/TpevFQD8bmgBqJIDfYzPBFEDOz6e8SLjMRiIbsPYBhYJPGwzonQfW
whrCV3PFgosITjCu2KbC0KhvCRma+fp/FGI4GvZkSM/ywfRk2XfHd7rMp1T6jDYwcxOP9BvYM/B1
o2CXghANIUnFcEx5WpqVMKe0fDR0ejRoYJ1OGg6HbCZ5RFiVusv1eMzX0S3rahMWVH5tQVYWghZs
HdWlV4wnQ/7skriLk5VCYZam58ZqkiC2uDdiLsxUeACaTNl87VUxHc5GJCZw4yVRMxmdi52Ejfkr
0k0QS5MQ53wnUTSofxOdD+k2uoVpHOkLrobtmCxCOdbtH54PH+qigGEe69nlhamXrQeXvHGyuW6K
xZLYBAnQPXw6VM8VjFiOh0PjCsYbT0cTYwQbRiubkdLUicnGgrIzWgLMQvA11jXSzHnRIPMYFjZb
pFZh+rLDmERG0zciFisBf4rp2BAt2LnqykW+/jr8tjwRDHgjiNz9Oj47801OJgZPTx90J2rSW+qT
R7uOn/1x9v6xf74HHfD5YJpvVrnMpMzf3aJDdJ5XWUnQxvyWGLMSpWmmCfhDHlfCTbEoeKrmA/nO
NifoM0is0n9+//zw+Qv+/fryfpQloJytIY+JCVb0NHfYPzdhqGSvLx9w9h+7C2pqhBhd8EeFX8BW
77l6mE7oWSkB9DBVAHpJ4mHp45kJGI7Nuw4A8UxOEhuCdplFqBBwKoz1rew4wJyYfuVRnF0OB7b6
0dOyelqp7W+HdxStWFV3ng3OBzHvUzqPs9GM47l+tAKeawQM+1nBn2urzFSwQi8b2kpUq2pGQ6ra
qN9WrTIFM4uBZtF4aN5QxMX0fMiLQYga88n4Gw4q8xhwh97UUhZX2WhwzjG120yAoEasAA3A/BYN
1Me4tn/Y89UJtc/H5wfmbCrGl+Opc7wZxM1KePl9fEKVDLfl/fFdXSQw60KKbFM2L2IU+iLHmNag
3tD9NR+OTBte1uernC/8i4sJX7Y8X5i21mJ32SMv7aB/5nEDz/J2UpQtxpaQ3yGj6ThSJfF4c9Tp
QWtcNN9ffmH01T9e6IyKS0OFHRVDy8zxD22pc+bw9IpmOnNXU348EHCGBDHJNYFW1suZsX6BBYax
qhydemnF+6XH0e5ycD40ZkXBegy0ZQxaBl90TKI4220Jx5UpVEvIiA0TFrvxcNYkgtVnGTMgZCVu
3QTsYX59dvd4fGXDvG1cO7QZVlyYV4ZClIciAkzqWUkwgYsEJfp6lXkaReYhrLbj6uas+Pz5Ln0g
u/nTOfMB3bmNzb24XmPpv6qYjySK7rTVTZ3tRD2aJXG9KkKOJRk02AitsmH2hDSMyT08wTmvxx6t
7+nN6ygzhNrcrCfW3L/ev70c740DKPHzNPTZnafJ22NHEMf/ZBMHsfVTCT3UsVGB8zhwF8Bqe/bx
tr+TTNIt2FSUXIIYFbBWklhjDamXLDQuKtOM08CzkjW9aLQumdnZ0tzOtqbbbGkkc2lC8bIc1mR/
wSvpixkv85a86FE9WsI2Wzs1MWtkLLzVLh0x2Hke+suA6eAiD4LboMH33/JnWEBUMafcajoPlkaC
EO1fSl/W+pyKRdU/EEiQhGnRzADs8joZ84lAZUQ5dGbX2ZuIbsFE0lfo+bO8uBwZs9SAi+Gk58xC
ArdWtKvNuLm4wtQoe4a/kWX1V54uojC2or+MFZvDv5PA43JUwMQkRm7/ToPxaF2TOKVxHLGMccOS
NXREZDBcwrMCy5Vb3YwdfwGzlyyLjPdGoIACwgloP5nIC+p7C6AwjWnd8WBXjuqFEWXVgOqdKEte
vQKKcb3gJETATOqF6Yo9kT1JixAm3ItcVBF4VR6WNxbGqporYesqCcvaisf8MfdHdL7xd290Hrwv
nnuwWY16uyGMEmBox1sgkJoBRS1GlugJkwXnEU/aVAPJtkAHhpcUCaUeJ5bwh6ThuIj6rif6W1cg
2kyM2CrAXFdpyYcq7/r6SvAyZMp4Ik2wMJ+K9+55yJpnBIkCPrqsFwIFihazXBQj41PmZa4/rlPZ
yn81ri2ZnF25aZe9Y9sS51VSFwKW4I1agyeo+9afwqoPJMJN+4ZggbWbVOXC7hAPI/Xt3IIe6YXb
cXQEYX6Ik0+4y1IjTk2zpnE3rcSo4aT7SD0gA8PC5AcwUVXfzGrOS2OpdOriZxY6uuX2WIed8A9N
Vj2XVQ3FbVFy8nUfu8I9Y/I2BWmSEKUZ/ewQo/gAjBGyRjRi4mOejRuDgu9EkHj5TWYNGAWDJLE0
Z76Qq4fNv7Ao7JKYvg0IFUBmqSCvFC1d96IG1mR9wDCOOJTTx604yVW6BmVRMgWstyJPrCFSCGcD
dfhFDKyLt20oHKdYy1a9kkyoqMp0UZjHlYKZC7jCPI0E4AGAxLCryHhKkMIcROKmB4YJ70KsCVrD
n9MEItoKWdIzitItHSJCHCZ+wAW3EpI4gC9PszaC3tvfPR4Ma0cSlN2xwG+ZQh6avOOMak816P+R
p/F3f+NL8cSRTsIivTw/H1hc+0cahQH/4lt4gmVjlb/QfE/3g3+3Mi6mxXc4T74HO/x/UvK9W0ie
SeS0Ap4zzpyNTYK/deQr5obNBAj7k/EFhw9Tb4USWXn15fj+glWt/xh+4QircjEzw9MWfdw8Ka31
KgGd/kSh+Zadv5NjoxT198Pn/cvZn9yYdYUKKWATm1lFCLCJ6sKCgZlFAOqrsUUlEEcUEz+GwDbp
J0mktwojPw+4tJ3rIE9ovxzduIwzdkjVn+5Y1TYCdxAIX8fUDMjSVeIPdqZovhj40YY5M4sB0Xo1
1bCazAdbjMoV3k2ygbvgrxINopkdNcQTcQzVIpkaq83E8cZmk6inRLtFxNljLZJRf0fYGA2LZHLi
cS72xCI5P/E4F71jkFxSvzkTQ90krGdGfZjJZc+ymV04XwlcFpdgzYW8GM8OR9NBT7OAGtrLURRe
yFlV6DuH5gdosDORGtE3ixrf+3F986fx53xHrN2nwZc8eDjugU/ssWkx/Rt1nYazmssY1iIr822Y
zwkOQZHYL5OJngJMBtjTmiIARajKU3sAJS5PRWmVHneJbvIwik6+YykCIHB7jcld1y4YTopI0ALD
LSKpwpLrqPz8f+poWeVrK1sMobDP3yoJcZVzFsu03l7TU8IwyqhwhsPd5xten3SZrNoT6oYcCfgL
ZL/rCq/VtYmiO+2CvAjhaAHJGQhBgl7y6meZV0Alc3OzBhqlPDQExstrf4Ul21XObXpuNqpe7cdB
Ia36ZR56pUvgQhZcMyBsbtPcMKm0uEyU3JzIbDkgOvlBAj1H9QTl2VqW8RWWWOCQ8fIsCLqovxRp
ldvVxHWnMNWyJ5uJYfJXQZT1uBu03Y9S4WchJ4y0JOjSwX46phkF0ZBNx09e4K39dJugNyEztBRd
ByKPyJxIHVUiUTAKIhwCDzOkJcY66yE7bSHpeUhiYTKAbdhJAZmxg13ek0y1fbmR6EYDMUo5EbCh
+WkMe3LvBRvugkNL4N2iF4RX4ah/+bV/vsdQga/4v/uX/zx//Xv/tIdf+/vX4/PX9/2fB2jweP/1
+PxxeMCd//Xn659fFDNYH96eD7/OHvdv9wd5P90xhf/q8sSeHZ+P6BR6/N99E8CgRVMP1nch1dR6
I3IYhBAT7mDpB2IkYKkwzbQ5fgCENQ4zh2ugx/jd0sBe0y9iZ8ggbN5FkdJagVW39QhTq4amwCsR
k6Cz+PMDo9H949oGf9lsuLU4prmy4FA7gEwxaKowChYHsZfd2NBdmtug7NqGYHLDc+CfXkpK1Ut2
nLaq+dvfrx8vZ3cvb4ezl7ezx8OvVxkjYxCDnkFNTQ1QREsjlZUBHrnwQPgs0CUt1l6YrahJyEK4
j6wwHzEHdEnzZMnBWEKSGcrqeG9PRF/n11nmUgPQbQGNky4pCBliybTbwA3p1US1Ga8cIzJPHuzK
XDS3HvbblovhaBZXJK9Bg0iqKHKoEeh+ifzjOy0A+1iBuOCQm8k7G2CbZUbZCz5//jre/fHX4e+z
O7miH972r49/Ows5L4TTvO8unMBzexF4/ooZYgDzGQ01Oge80/siHjkw4P+bYDSdynpy6vb+8+MR
fcvu9h+H+7PgWX4auvP95/jxeCbe31/ujhLl7z/21LymW/S4E0dPpGekGNaPrEAOFKNBlkY3Q6t2
oU0rgmVYDNkKkvozg+tww7wlgHcAC944LgJzGRL39HJPk+Pqrs3dSfEWcxdW5u7YMis58Nxno3zr
PJsy78iwMzbhjnkJiLnbXFafdEYPU42W1YkZwuuJjWbUK0yv3DMwsXBHZsUBd1y3N0jZxRAf3j/c
N+TeeMSMPoLdl+xYZjyPxDoYuUOp4O7IQePlcICF6h0WtFLJ5+0R/TdrNvZ5b/0WzansGhnCsgVZ
0yi9rBlL7GPQk3NgrcSQA46m5xx4OmQOw5UYM/yDgZUgzMzTpYPYZqpdxSGOr4+Gu0S7mQuGuwHU
ykFnU4Ags+1Pg9pMpcBkp+EJNukJVEFVUg9nIQBu6u5ogJ4zPfaDnhS0jSQj/57oSMP/mJZBLctA
tTjB7eKJ003QPHF03DNNwbtvVpPz8vSKvqimCK4/bBEJWu9Fs6zb1Gl9ZlY0aCm58PQOuXKXNV5Y
at6Qgxry8nSWfD79PLzpsGWupyIpwtrL8sRdin4+X1o5mSlmZeUBN3Di9CKTRF7J2a4IhfPeHyGq
GAG6DFIpm0iQ0uPCkpd/HX++7UE7eHv5/Dg+MzwZY+TUlnLhDcdr692doHFnG3BqjZ58XJHwqFbM
IAX3TpGxaM1rQaIKb4Ory1MkpzqqiU58RSeMsEQ93HS1dZdYsKlFGdu56hwsSn/9WHzfYCKY/YU0
bhpXpp0Yi5559XIX9bRCKHodO0DFi+MALWPSllbeZKbqqJFZNY8amqKam2S76eCy9gK0TIUeunC1
/ludGXDtFTO8Qd8gHltRNJzDK5BewO4uCjTO265gCitDeNaB4UyL5pQAi5spFwXpjoLdsSrxqf2H
wat/Son4XVbeeD8+PCsv5LvHw91foIkTT8DUr6BBaF++8ssdPPz+HZ8AshqUhW+vh6f2CkxdpFF7
Zh5SVdHFF1df7KeV6kSG1HneoZDZ2q8mg8tzw0iVJr7Ib+zu8CYt1TLwDG8dhUXJE+tL638xgrrL
8zDBPkj/icVVG+zbx/uUvSG7putHw+o5qHbA33PO3oY+WyIH2mRpiiHo/c27q8xDEHcw4TwZYe3H
DZJQ4mU39SJPY8u3hJJEQWJhvTT3KT/EIncBKLHxHF7UkSmLteEqpj3IvdB2eBS5t8LXgJie7byV
sl3mwcI85zxQ1uAkYhmHNzTYm1e7crFXh2VVG2YKSzSHnzS/N301YoBFBPMb3jHWIOkTnyWJyLeC
LYKp8PPQfjWbMAfghiDl0dI+4dxVRrwZYWla+yArMPHTmHw+80oQmFqXsO5lCEVXaBt+i+cOSAWm
PCahjpQG4lnX8t8USlom8AlLDbIZ0z+k5lpBqY0hl2COfneLYOKyKX/Xu9m5TaPiEzLPgYdCXmSb
QEGLGnSwcgUbykEUcGC47c69H3QuG2jPLHbfVs9vQ2pCIxjlvOfCpajrbGh646PXUxBgzeYoNTIQ
Uig2S/fsnNYJFUWReiFwkA2mys8FETrRhg7cg0ZZIMgouIO1awzHv0S+WCEiXYmZ4mRtHpHJ6yUq
IiBfapqvtzlGl8FYzJ0SRPAtkcgRuZJyMtNCEZRV5vasxZfA3OVljUOCgCRNdNuYsDYzsXmgQO0S
QKDI+suh6M9tzxtyAi8jNaFknqN0bv7quOSTsxhkMSm60L3oti4FaSHMr1GmJUdDnIWqqFTzO5Ul
aJdwTBuZulP4el0GgkZTAJz1qUX62e+Z1cLsN113EiTgUEtM0gLjjFLSR3mR4gdZWlowpQDBqYjZ
sgctChi5MVF4QZsszfOlDYy0pAV7UBXXlFFDYSGnZxu0JZnaWxYt2Uno69vx+eMvFR34dHh/cC+6
pcSyrjHw2xAnFBgrcLMSLPyBLYxesssIhIuoNf9f9FJcV2FQXk3a2W6kX6eFlmKepqXuiB9EdP/7
N4nAamWWh7oBtu6IQM6fpyjfB3kOVHTvSmr4D4SkeVoEdFJ6B7C1Qhx/Hf74OD41MuG7JL1T8Deu
QpZ6W09swiKHnknP26vhYDShN955mAFHxDiymLfb5IHwVVmRgi0gDmhM6x4msF7ptlMdKpT/N3rL
xaL0CGu0MbJ7GD5wYzGwrYBNpL4gS2WwDXXGpHCDS8nXq1vpbSDWMu+8l1W8SP5vB/y/aHWYZm/4
h5+fDw94Axk+v3+8fT411dH0gsTK2agh5OR6kADb288gkRVkBr+HxMmQ0KmwS/bUlZ9aMJ/f7Gf8
Pzu5LRleUEnKGMObTrykabBxImgPSXmWwmStlz5hte6vepUmadVcv6KqZKGb2NJml1NGLNH9QRgS
vfb5qsjVvLC9g6w6OCfn0hwD5fDgDjY6hDrqcnOJ3bZLOCRyKdBFMbsrNbqqxhCrT0rrPS2qWTF6
AXEGAXwHnPuGGUDaBtKwSG03/K55jEo5sV7y1BelcIRAi2rLOakrVDrHuBBmwTaIntpFLCl6EPwL
MpmChK0iaZA1fkosLvcqye768MBhgMG0AYI9VOakXQ1bfhhVc01KloMEo+RYWNutWYxwbEfA3tyh
1JjeT1byRYWnJX268FYoz0pkkPgqwKe3kU3svnkTyystO3rApsnn9hABMFuC+rbkZNiGRNXjZF6q
EL0vVJVZpN8Jy7dEIVx/GgllzKcKi2sFpa4klSFiWMhP+H6j2XWMSfTxHoc32N9UrDAs32Ypkv4s
fXl9/3qGKUM/X9Vhtdo/PxgiQQa98tDJJk0zbuUbeIwireD0MZG4a9KqvCKVCYt0USLzRoUjKGFJ
syWEFapeVTA+pSiMPaWOuxbVvmTYCbgoo2EBh5iQyR4Rna6PpPmSdmNtr0GEAAHDTw1uJw2h6kP4
GImTw6z8PEFUuP+UBb0Jf7d2Up+apLDN1QaF6c3e+TExr7GXCo7hOgjsBCTKXohX+t3J9t/vr8dn
vOaHD3v6/Dj8PsA/Dh933759o4WQU11GfSk1C7tWb5ZjtVUm3k0hcrFVTSQwzH1mU0mAn9u7a3PQ
SKsy2NGLnGZvdIX/zH3Ok2+3CgP8NN2iz6lNkG+LIHYekz20NFbpchlkDgCta8XVcGqDpatF0WDP
baxitGWONUkUyeUpEqkOKrqJ86IQTqhI5KASBZVubeR+kOq8tYB0neYIFtGJ47SZcGkAaCvlcgZl
HDhgDeikqf2H2qa6yeg3CBbewnyeqrT/jwWt21PDB/zUOl8avcmBy0GXD3UwqaGgt2OVFEHgw/ZV
pk3m8FWnfQ/v/ksJm/f7j/0ZSpl3aPynxajVUBvScSOcNUD7oGDtMBIlozZDQ2dSIkYtZThQZjF1
QWi6Xp7sptm+lweNv2+hbQawClmBVzEGj1w9WxOsNU6QswpPRBzcWlIEg4HUxlOdBovP4Uzy+i1g
g2smfrtLT2R8jyPmXjdaZu7ol6YhQG4JEPjR2GL0D+3ViXdTplzSmUQmvoPOE4FSii2LKlEKNIvV
JouFtYQZZL0NyxVaxGwJs0HHUqCVXqy5b5Fg+B5uCEkptXC7Ea95ULVCpl627ZksXBqx7Fp4sqab
pDduA+FPiaNZQPdBgLNHIQO1IIaFDYoz2zmnvQZATrrOBuisHs0kZGVjQ9xToObzZNfZpJSUStmi
SH4lilQW6ifnBQyHcUhgx82DE6+XRf+YttWvBa9oNzRYabyO8a489vGmj1e8VeBIY150uOH+7YmX
nLBSbFZiuKguPcuFAydbDIXO+21ALQW017svq4IzHEX9mgQs9zDxosoPrr7cY++/z0bTwbfii9Wu
AOFlZsTOEUS2uimuBr8HmG/5z8OAoUCFBigOg14KbBx1hEV5NepDb9Wetb6uw2PBJ28VcpwH+Iu+
mmm/92l/9/j98/mucZP69th+NE5Zs+C6875hoOY8U7tyeXj/wCMcBWvv5X8Ob/sHkjxUJn8xdCmZ
DaZ/SXTZYrrdpGBNEXIWJxmYmWFGn5po1U1zLo9FFvNEBt8wk2BwPiRau12bIQJKwQTFEcCaSxim
IKTnjzPgsnhnXiq5W/p69b0YL8VhX5qnbAewQy34yXLiMdRNwf8B+HC+WA10AQA=
--===============3524813310410975804==--

